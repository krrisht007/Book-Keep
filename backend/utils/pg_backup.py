"""Postgres-native backup/restore: a full JSON dump/restore of every table,
built from SQLAlchemy's own metadata rather than shelling out to
pg_dump/pg_restore. Those need the full PostgreSQL client tools installed
on whatever machine runs the backend — see database.py's own comment on
this being "the shop's own machine" — a real extra system-level install
this app has never required before, and won't reliably be present.

Every primary key in this schema is an app-generated UUID string (see
models.py's `default=lambda: str(uuid.uuid4())`), never a DB-assigned
serial/identity column, so there's no sequence to reset after restore
either — a plain delete-then-insert per table, in FK-dependency order
(`Base.metadata.sorted_tables`), is enough.

The one wrinkle: two tables (bills, purchases) self-reference their own
`id` via a nullable return_of_*_id column (a return credit note points
back at the bill/purchase it returns). Detected generically here — not by
column name — and restored in two passes so the referenced row always
exists before the FK pointing at it is written.
"""
import json
from datetime import datetime, date

from sqlalchemy import DateTime, select

from database import Base, engine
import models  # noqa: F401 — importing this registers every table onto

def _serialize(value):
    if isinstance(value, (datetime, date)):
        return value.isoformat()
    return value

def _deserialize(col_type, value):
    if value is None:
        return None
    if isinstance(col_type, DateTime):
        return datetime.fromisoformat(value)
    return value

def _self_ref_columns(table):
    """Columns on `table` whose foreign key points back at `table` itself."""
    return [
        col.name
        for col in table.columns
        if any(fk.column.table.name == table.name for fk in col.foreign_keys)
    ]

def dump_postgres() -> bytes:
    """Every row of every app table, as one JSON document."""
    tables = Base.metadata.sorted_tables
    doc = {"version": 1, "dumped_at": datetime.utcnow().isoformat(), "tables": {}}
    with engine.connect() as conn:
        for table in tables:
            rows = conn.execute(select(table)).mappings().all()
            doc["tables"][table.name] = [
                {k: _serialize(v) for k, v in row.items()} for row in rows
            ]
    return json.dumps(doc).encode("utf-8")

def restore_postgres(raw: bytes) -> None:
    """Wipes every app table and reloads it from a dump_postgres() document.
    Runs as one transaction — a failure partway through leaves the database
    exactly as it was before the restore, never half-swapped."""
    try:
        doc = json.loads(raw.decode("utf-8"))
    except (UnicodeDecodeError, json.JSONDecodeError) as e:
        raise ValueError("Not a valid backup file") from e
    if not isinstance(doc, dict) or "tables" not in doc:
        raise ValueError("Not a valid backup file")

    tables = Base.metadata.sorted_tables
    with engine.begin() as conn:
        for table in reversed(tables):
            conn.execute(table.delete())
        for table in tables:
            rows = doc["tables"].get(table.name, [])
            if not rows:
                continue
            self_ref = _self_ref_columns(table)
            pk_col = next(iter(table.primary_key.columns), None)
            to_insert = []
            deferred = []
            for row in rows:
                clean = {
                    k: _deserialize(table.columns[k].type, v)
                    for k, v in row.items()
                    if k in table.columns
                }
                patch = {c: clean[c] for c in self_ref if clean.get(c) is not None}
                if patch and pk_col is not None:
                    for c in patch:
                        clean[c] = None
                    deferred.append((clean[pk_col.name], patch))
                to_insert.append(clean)
            conn.execute(table.insert(), to_insert)
            for pk_value, patch in deferred:
                conn.execute(
                    table.update().where(pk_col == pk_value).values(**patch)
                )
