"""Sends an invoice/statement PDF by email via the shop's own SMTP account
(see routers/admin.py's /admin/smtp-settings — deliberately separate from
the general /settings, which any signed-in staff account can currently
write; an SMTP password has no business being reachable there).

Uses stdlib smtplib/email only — no third-party mail API dependency.
"""
import smtplib
from email.mime.application import MIMEApplication
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

from sqlalchemy.orm import Session

import models

class EmailNotConfigured(Exception):
    """Raised when the admin hasn't set up SMTP yet — surfaced to the app
    as a 400 with a message pointing at the admin panel, not a 500."""

class EmailSendFailed(Exception):
    """Raised when SMTP is configured but sending itself failed (bad
    credentials, network issue, provider rejected it, ...)."""

def _smtp_settings(db: Session) -> dict:
    stored = {row.key: row.value for row in db.query(models.Setting).all()}
    return {
        "host": stored.get("smtp_host") or "",
        "port": int(stored.get("smtp_port") or 0) or None,
        "username": stored.get("smtp_username") or "",
        "password": stored.get("smtp_password") or "",
        "from_name": stored.get("smtp_from_name") or "",
    }

def send_email(
    db: Session,
    to_email: str,
    subject: str,
    body_text: str,
    attachment_bytes: bytes,
    attachment_filename: str,
) -> None:
    cfg = _smtp_settings(db)
    if not (cfg["host"] and cfg["port"] and cfg["username"] and cfg["password"]):
        raise EmailNotConfigured(
            "Email isn't set up yet — ask an admin to add SMTP details in the admin panel."
        )

    from_display = f'{cfg["from_name"]} <{cfg["username"]}>' if cfg["from_name"] else cfg["username"]
    msg = MIMEMultipart()
    msg["From"] = from_display
    msg["To"] = to_email
    msg["Subject"] = subject
    msg.attach(MIMEText(body_text, "plain"))

    part = MIMEApplication(attachment_bytes, Name=attachment_filename)
    part["Content-Disposition"] = f'attachment; filename="{attachment_filename}"'
    msg.attach(part)

    try:
        with smtplib.SMTP(cfg["host"], cfg["port"], timeout=20) as server:
            server.starttls()
            server.login(cfg["username"], cfg["password"])
            server.sendmail(cfg["username"], [to_email], msg.as_string())
    except Exception as exc:
        raise EmailSendFailed(str(exc)) from exc
