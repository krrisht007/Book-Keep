"""AI "Ask Your Shop": answers a plain-English question about the business
using ONLY a snapshot of already-computed report figures — see
routers/reports.py's POST /reports/ask. Same anti-hallucination discipline
as utils/ai_morning_briefing.py: the facts are computed here from plain DB
queries (the same ones the Reports screen already shows), and the model only
turns them into an answer — it never runs its own query and can't touch
data outside that snapshot. The prompt forbids inventing any number, name,
or event not present in the facts, and tells it to say so plainly when the
facts don't cover what was asked, rather than guessing.

Uses Google Gemini (free tier), same as utils/ai_morning_briefing.py, so
this doesn't draw down the shop's paid Anthropic credit.

Gemini is called through utils/gemini.py.
"""
import base64
import io
import json
import re
import wave

from utils import gemini
from utils.gemini import AiScanNotConfigured, GeminiAPIError
from config import GEMINI_API_KEY, GEMINI_TEXT_MODELS, GEMINI_TTS_FALLBACK_MODEL, GEMINI_TTS_MODEL, GEMINI_TTS_VOICE

_SYSTEM = (
    "You are a plain-spoken assistant for a hardware store owner. Answer "
    "their question using ONLY the facts given as JSON — recent monthly "
    "sales/profit, this month's expenses by category, current stock "
    "valuation, top-selling items, low-stock items, and customer dues. "
    "Never invent a number, name, or event not present in those facts. If "
    "the facts don't contain enough to answer the question, say so plainly "
    "rather than guessing. 2-4 sentences, plain language, no markdown, cite "
    "the actual figures you used. All money is in Pakistani rupees: write "
    "amounts as \"Rs 1,234\" — never use a $ or any other currency symbol."
)

TTS_VOICES = (
    "Leda", "Aoede", "Zephyr", "Sulafat", "Despina",
    "Puck", "Charon", "Fenrir", "Orus",
)

_INTERACTIONS = "https://generativelanguage.googleapis.com/v1beta/interactions"

_TONES = {
    "calm": "calm and soothing",
    "warm": "warm and friendly",
    "cheerful": "cheerful and bright",
}
_PACES = {"slower": "speaking slowly", "faster": "speaking rapidly"}

def answer_question(question: str, facts: dict, language: str | None = None) -> str:
    if not GEMINI_API_KEY:
        raise AiScanNotConfigured(
            "Ask Your Shop isn't set up — GEMINI_API_KEY is missing from "
            "backend/.env. Get a free key at https://aistudio.google.com/apikey"
        )
    body = {
        "systemInstruction": {"parts": [{"text": _SYSTEM + gemini.reply_language(language)}]},
        "contents": [
            {
                "parts": [
                    {
                        "text": f"Facts: {json.dumps(facts)}\n\nQuestion: {question}",
                    }
                ]
            }
        ],
        "generationConfig": {
            "maxOutputTokens": 2048,
            "thinkingConfig": {"thinkingBudget": 0},
        },
    }
    response = gemini.post_any(GEMINI_API_KEY, GEMINI_TEXT_MODELS, body, 40)

    data = response.json()
    try:
        candidate = data["candidates"][0]
        parts = candidate["content"]["parts"]
    except (KeyError, IndexError) as exc:
        raise GeminiAPIError(f"Unexpected Gemini response shape: {data}") from exc
    text = "".join(p.get("text", "") for p in parts).strip()
    if candidate.get("finishReason") == "MAX_TOKENS":
        text += " [cut off — try a more specific question]"
    return text

def _speakable(text: str) -> str:
    """"Rs 1,234" is read as "1,234 rupees"; markdown marks are dropped."""
    text = re.sub(r"\bRs\.?\s*([\d,]+(?:\.\d+)?)", r"\1 rupees", text, flags=re.I)
    return re.sub(r"[*_`#]+", "", text).strip()

def _pcm_to_wav(pcm: bytes, rate: int) -> bytes:
    buf = io.BytesIO()
    with wave.open(buf, "wb") as w:
        w.setnchannels(1)
        w.setsampwidth(2)
        w.setframerate(rate)
        w.writeframes(pcm)
    return buf.getvalue()

def speak(
    text: str, voice: str | None = None, pace: str | None = None, tone: str | None = None
) -> bytes:
    """Read an answer aloud with Gemini's text-to-speech; returns a WAV file.
    Gemini picks the language from the text itself. `voice` must be one of
    TTS_VOICES, `pace` one of slower/normal/faster and `tone` one of
    calm/warm/cheerful; anything else falls back to the default. Gemini 3.8
    reads the text field verbatim, so tone and pace go in speech_metadata.style
    and only the answer is in the text. The free tier caps each voice model at
    a few requests per day, so a 429 moves on to GEMINI_TTS_FALLBACK_MODEL."""
    if not GEMINI_API_KEY:
        raise AiScanNotConfigured("GEMINI_API_KEY is missing from backend/.env")
    style = ", ".join(p for p in (_TONES.get(tone, _TONES["warm"]), _PACES.get(pace)) if p)
    models = list(dict.fromkeys([GEMINI_TTS_MODEL, GEMINI_TTS_FALLBACK_MODEL]))
    for model in models:
        body = {
            "model": model,
            "input": [{"type": "user_input", "content": [{
                "type": "text",
                "text": _speakable(text),
                "annotations": [{"type": "speech_metadata", "style": style}],
            }]}],
            "response_format": {"type": "audio"},
            "generation_config": {"speech_config": [{"voice": voice if voice in TTS_VOICES else GEMINI_TTS_VOICE}]},
        }
        last = model == models[-1]
        try:
            response = gemini.post(
                GEMINI_API_KEY, model, body, 45, _INTERACTIONS,
                gemini.TRANSIENT if last else gemini.TRANSIENT - {429},
            )
            break
        except GeminiAPIError as exc:
            if last or exc.status != 429:
                raise
    try:
        clips = [
            c for s in response.json()["steps"] if s.get("type") == "model_output"
            for c in s["content"] if c.get("type") == "audio"
        ]
        audio = base64.b64decode(clips[-1]["data"])
    except (KeyError, IndexError, ValueError, TypeError) as exc:
        raise GeminiAPIError("Gemini returned no audio") from exc
    return audio if audio[:4] == b"RIFF" else _pcm_to_wav(audio, 24000)

def to_mp3(wav: bytes) -> tuple[bytes, str]:
    """(audio, mime type). Gemini's WAV is about 48 KB per second of speech and
    the app downloads it over mobile data, which was most of the wait before the
    voice started; as 48 kbps MP3 it is about 8x smaller. Falls back to the WAV
    if the encoder is missing or the audio is not 16-bit PCM."""
    try:
        import lameenc

        with wave.open(io.BytesIO(wav)) as w:
            if w.getsampwidth() != 2:
                return wav, "audio/wav"
            rate, channels, pcm = w.getframerate(), w.getnchannels(), w.readframes(w.getnframes())
        enc = lameenc.Encoder()
        enc.set_bit_rate(48)
        enc.set_in_sample_rate(rate)
        enc.set_channels(channels)
        enc.set_quality(2)
        return bytes(enc.encode(pcm) + enc.flush()), "audio/mpeg"
    except (ImportError, wave.Error, EOFError):
        return wav, "audio/wav"
