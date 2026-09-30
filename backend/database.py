import os

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base

from config import DB_PATH

def _normalize(url: str) -> str:
    """SQLAlchemy's bare "postgresql://" scheme defaults to the psycopg2
    driver; rewrite to "postgresql+psycopg" so it picks the psycopg3 driver
    this project actually installs (see requirements.txt) — lets a
    connection string copy-pasted straight from Neon's dashboard work
    unmodified rather than asking the user to hand-edit its scheme."""
    if url.startswith("postgresql://") or url.startswith("postgres://"):
        return "postgresql+psycopg://" + url.split("://", 1)[1]
    return url

if os.getenv("VERCEL") and not os.getenv("DATABASE_URL"):
    raise RuntimeError(
        "DATABASE_URL is not set. On Vercel it must be provided as an "
        "environment variable for this deployment's environment."
    )

DATABASE_URL = _normalize(os.getenv("DATABASE_URL") or f"sqlite:///{DB_PATH}")
DIRECT_DATABASE_URL = _normalize(os.getenv("DATABASE_URL_UNPOOLED") or os.getenv("DATABASE_URL") or f"sqlite:///{DB_PATH}")

IS_POSTGRES = DATABASE_URL.startswith("postgresql")

# Pooled connection — every request handled by the app goes through this one.
# pool_pre_ping: a connection Neon's serverless proxy drops after sitting
# idle would otherwise get handed to the next request and die mid-query
# ("server closed the connection unexpectedly") — this pings and silently
# reconnects instead. SQLite has no such idle-drop behavior so it's a no-op
# there.
# pool_recycle: pre_ping alone still has a narrow gap — a connection Neon
# kills between the ping and the actual query running (more likely the
# longer it's sat idle) still surfaces the same error. Proactively
# recycling anything older than 280s (under Neon's own ~5min idle
# timeout) means the pool never hands out one old enough to be in that
# window, so pre_ping's check is checking a connection young enough to
# trust.
engine = create_engine(
    DATABASE_URL,
    connect_args={"check_same_thread": False} if not IS_POSTGRES else {},
    pool_pre_ping=True,
    pool_recycle=280,
)
ddl_engine = (
    engine
    if DIRECT_DATABASE_URL == DATABASE_URL
    else create_engine(DIRECT_DATABASE_URL)
)

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()