"""Shared CSV response helper for export/GST-CSV endpoints."""
import csv
from io import StringIO
from typing import List

from fastapi.responses import Response

def _csv_response(filename: str, rows: List[List]) -> Response:
    buf = StringIO()
    writer = csv.writer(buf)
    for row in rows:
        writer.writerow(row)
    return Response(
        content="﻿" + buf.getvalue(),
        media_type="text/csv",
        headers={"Content-Disposition": f'attachment; filename="{filename}"'},
    )
