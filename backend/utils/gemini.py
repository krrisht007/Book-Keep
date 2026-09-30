"""Shared plumbing for every Gemini call (Ask Your Shop, voice, bill scan,
morning briefing): one plain-httpx POST with one retry. The google-genai SDK
client intermittently raised "Cannot send a request, as the client has been
closed" here while the same request against the raw REST endpoint always
worked, so no SDK is used."""
import time

import httpx

ENDPOINT = "https://generativelanguage.googleapis.com/v1beta/models/{model}:generateContent"
TRANSIENT = frozenset({429, 500, 502, 503, 504})


LANGUAGE_NAMES = {
    "ar": "Arabic", "bn": "Bengali", "de": "German", "en": "English", "es": "Spanish",
    "fa": "Persian", "fr": "French", "hi": "Hindi", "id": "Indonesian", "ja": "Japanese",
    "ko": "Korean", "pa": "Punjabi", "ps": "Pashto", "pt": "Portuguese", "ru": "Russian",
    "sd": "Sindhi", "sw": "Swahili", "tr": "Turkish", "ur": "Urdu", "zh": "Chinese",
}


def reply_language(code: str | None) -> str:
    """Sentence for the end of a system prompt: reply in the app's language
    (English for an unknown or missing code). Names and money stay as given."""
    name = LANGUAGE_NAMES.get((code or "").strip().lower()[:2], "English")
    return f' Write your whole reply in {name}; keep names as written and money as "Rs 1,234" with Latin digits.'


class AiScanNotConfigured(Exception):
    pass


class GeminiAPIError(Exception):
    def __init__(self, message: str, status: int | None = None):
        super().__init__(message)
        self.status = status


def post_any(api_key: str, models: list[str], body: dict, timeout: int) -> httpx.Response:
    """Try each model in turn. The free tier caps every model at a few requests
    per day (429), models are sometimes overloaded (5xx) and requests can time
    out, so all of those move on to the next model; the last model gets the usual retry."""
    for model in models[:-1]:
        try:
            return post(api_key, model, body, timeout, retry_on=TRANSIENT - {429})
        except GeminiAPIError as exc:
            if exc.status is not None and exc.status not in TRANSIENT:
                raise
    return post(api_key, models[-1], body, timeout)


def post(
    api_key: str, model: str, body: dict, timeout: int, url: str | None = None, retry_on: frozenset = TRANSIENT
) -> httpx.Response:
    """POST to Gemini (generateContent unless `url` is given); one retry on a status in `retry_on`."""
    for attempt in range(2):
        try:
            response = httpx.post(
                url or ENDPOINT.format(model=model),
                headers={"x-goog-api-key": api_key},
                json=body,
                timeout=timeout,
            )
            response.raise_for_status()
            return response
        except httpx.HTTPStatusError as exc:
            if attempt == 0 and exc.response.status_code in retry_on:
                time.sleep(2)
                continue
            raise GeminiAPIError(
                f"Gemini returned HTTP {exc.response.status_code}", exc.response.status_code
            ) from exc
        except httpx.HTTPError as exc:
            raise GeminiAPIError(f"Gemini request failed ({type(exc).__name__})") from exc
