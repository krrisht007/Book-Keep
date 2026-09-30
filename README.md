# Hardware Store Book Keeper

A mobile-first bookkeeping app for small retail and hardware stores. It replaces paper ledgers and spreadsheets with one app for billing, customer dues, inventory, supplier purchases, expenses, cash reconciliation and sales-tax reports. Amounts are in Pakistani rupees.

The full feature list is in [docs/PRD.md](docs/PRD.md).

## What it does

- **Billing:** bills and quotations, PDF invoices to print or share, returns and voids, payments against a bill.
- **Customers and suppliers:** running balances (udhaar), credit limits, ledger statements, WhatsApp and email reminders.
- **Inventory:** items with barcodes and printable labels, stock counts with a full history, price history, a rate-card PDF, low-stock alerts.
- **Reports:** sales and profit, stock valuation, expenses, cash reconciliation, sales-tax (GST/STRN) summaries.
- **Offline use:** bills can be captured without a connection and synced later.
- **Optional AI helpers:** scanning a bill photo, "Ask Your Shop" questions and a morning briefing. These need a Gemini API key on the backend and are off without one.
- **20 languages**, including right-to-left scripts and each language's own digits.
- **Accounts:** sign-in with Firebase, an admin panel, and per-user permission for deleting and voiding.

## How it is built

- **App:** Flutter (Android is the main target).
- **Backend:** Python FastAPI in `backend/`, with Postgres in production and a local SQLite file when no `DATABASE_URL` is set. It is single-tenant: one shop per deployment.
- **Auth and push:** Firebase.

## Running it yourself

You bring your own Firebase project and backend; none of the author's accounts or data are included.

**Backend**

```
cd backend
python -m venv venv
venv/Scripts/pip install -r requirements.txt     # on macOS/Linux: venv/bin/pip
venv/Scripts/python -m uvicorn main:app --port 8000
```

With no Firebase service account configured the API runs open, which is fine for local development only. Settings come from environment variables; the names are in `backend/config.py` (for example `DATABASE_URL`, `FIREBASE_SERVICE_ACCOUNT_PATH`, `GEMINI_API_KEY`, `ADMIN_EMAILS`, `SHOP_NAME`).

**App**

```
flutter pub get
flutter run --dart-define=BASE_URL=http://10.0.2.2:8000     # 10.0.2.2 is the Android emulator's host
```

Add your own `android/app/google-services.json` from your Firebase project before building for a device. It is not part of this repository.

## Tests

```
backend/venv/Scripts/python backend/run_tests.py          # backend self-checks
backend/venv/Scripts/python backend/run_tests.py --app    # plus flutter analyze and flutter test
```

Each backend check runs on a throwaway in-memory database.

## Releases

Pushing a tag named `release-<anything>` builds a signed release APK in GitHub Actions (`.github/workflows/release-apk.yml`). It needs these repository secrets: `KEYSTORE_B64`, `STORE_PASSWORD`, `KEY_PASSWORD`, `KEY_ALIAS`, `GOOGLE_SERVICES_JSON`, `BASE_URL` and `BLOB_READ_WRITE_TOKEN`. The last one publishes the APK to a Vercel Blob store used by the in-app updater, so you can drop that step if you don't use it.

## License

[MIT](LICENSE)
