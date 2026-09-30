"""Self-check for Gemini text-to-speech (utils/ai_ask_shop.speak). Mocks the
HTTP call. Run: venv/Scripts/python.exe test_speak.py"""
import base64
import io
import time
import wave
from unittest import mock

import httpx

import utils.ai_ask_shop as m
from utils.gemini import GeminiAPIError

m.GEMINI_API_KEY = "x"

def fake(data):
    r = mock.Mock()
    r.raise_for_status = lambda: None
    r.json = lambda: {"steps": [
        {"type": "user_input", "content": [{"type": "text", "text": "ignored"}]},
        {"type": "model_output", "content": [{"type": "audio", "mime_type": "audio/wav",
                                              "data": base64.b64encode(data).decode()}]},
    ]}
    return r

assert m._speakable("Sales were Rs 1,234.50 and **good**") == "Sales were 1,234.50 rupees and good"

pcm = b"\x01\x00" * 24000
with mock.patch.object(httpx, "post", return_value=fake(pcm)):
    wav = m.speak("hello")
with wave.open(io.BytesIO(wav)) as w:
    assert (w.getframerate(), w.getnchannels(), w.getnframes()) == (24000, 1, 24000)

with mock.patch.object(httpx, "post", return_value=fake(wav)):
    assert m.speak("hello") == wav

for empty in ({"steps": []}, {"steps": [{"type": "model_output", "content": [{"type": "text", "text": "hi"}]}]}):
    bad = mock.Mock(raise_for_status=lambda: None, json=lambda empty=empty: empty)
    with mock.patch.object(httpx, "post", return_value=bad):
        try:
            m.speak("hello")
            raise SystemExit("expected GeminiAPIError")
        except GeminiAPIError:
            pass

def sent(*args):
    with mock.patch.object(httpx, "post", return_value=fake(wav)) as post:
        m.speak(*args)
    return post.call_args

def voice_sent(choice):
    return sent("hello", choice).kwargs["json"]["generation_config"]["speech_config"][0]["voice"]

assert voice_sent("Aoede") == "Aoede"
assert voice_sent("NotAVoice") == m.GEMINI_TTS_VOICE
assert voice_sent(None) == m.GEMINI_TTS_VOICE
assert voice_sent("Puck") == "Puck"

call = sent("Hi")
assert call.args[0] == m._INTERACTIONS
part = call.kwargs["json"]["input"][0]["content"][0]
assert part["text"] == "Hi"

def style_sent(*args):
    part = sent("Hi", None, *args).kwargs["json"]["input"][0]["content"][0]
    assert part["text"] == "Hi"
    return part["annotations"][0]["style"]

assert style_sent() == "warm and friendly"
assert style_sent(None, "calm") == "calm and soothing"
assert style_sent("slower", "cheerful") == "cheerful and bright, speaking slowly"
assert style_sent("faster", "warm") == "warm and friendly, speaking rapidly"
assert style_sent("normal", "calm") == "calm and soothing"
assert style_sent("warp", "angry") == style_sent()

mp3, mime = m.to_mp3(wav)
assert mime == "audio/mpeg" and type(mp3) is bytes and mp3[:1] == b"\xff" and len(mp3) * 4 < len(wav)
with mock.patch.dict("sys.modules", {"lameenc": None}):
    assert m.to_mp3(wav) == (wav, "audio/wav")
assert m.to_mp3(b"not a wav") == (b"not a wav", "audio/wav")

def status_error(code):
    resp = mock.Mock(status_code=code)
    return httpx.HTTPStatusError("boom", request=mock.Mock(), response=resp)

def failing(code):
    r = mock.Mock()
    r.raise_for_status = mock.Mock(side_effect=status_error(code))
    return r

def model_of(call):
    return call.kwargs["json"]["model"]

with mock.patch.object(time, "sleep"):
    with mock.patch.object(httpx, "post", side_effect=[failing(429), fake(wav)]) as post:
        assert m.speak("hello") == wav and post.call_count == 2
        assert [model_of(c) for c in post.call_args_list] == [m.GEMINI_TTS_MODEL, m.GEMINI_TTS_FALLBACK_MODEL]
    with mock.patch.object(httpx, "post", side_effect=[failing(503), fake(wav)]) as post:
        assert m.speak("hello") == wav and post.call_count == 2
        assert {model_of(c) for c in post.call_args_list} == {m.GEMINI_TTS_MODEL}
    with mock.patch.object(httpx, "post", side_effect=[failing(429)] * 3) as post:
        try:
            m.speak("hello")
            raise SystemExit("expected GeminiAPIError")
        except GeminiAPIError as e:
            assert e.status == 429 and post.call_count == 3
    with mock.patch.object(httpx, "post", return_value=failing(400)) as post:
        try:
            m.speak("hello")
            raise SystemExit("expected GeminiAPIError")
        except GeminiAPIError:
            assert post.call_count == 1
m.GEMINI_API_KEY = "SECRETKEY123"
leaky = mock.Mock()
leaky.raise_for_status = mock.Mock(side_effect=httpx.HTTPStatusError(
    "Client error for url https://x/y?key=SECRETKEY123",
    request=mock.Mock(), response=mock.Mock(status_code=400)))
with mock.patch.object(httpx, "post", return_value=leaky) as post:
    try:
        m.speak("hello")
        raise SystemExit("expected GeminiAPIError")
    except GeminiAPIError as e:
        assert "SECRETKEY123" not in str(e) and "400" in str(e)
    assert "SECRETKEY123" not in str(post.call_args.kwargs.get("params", ""))
    assert post.call_args.kwargs["headers"]["x-goog-api-key"] == "SECRETKEY123"
m.GEMINI_API_KEY = "x"
print("OK")
