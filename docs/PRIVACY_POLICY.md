# Privacy Policy — Book-keep

**Last updated:** [DATE — fill in before publishing]

This policy covers the Book-keep mobile app and its backend. It's written
against what the app actually does as of this date — update it whenever a
feature changes what data is collected or where it goes.

> ⚠️ **Before publishing:** fill in every `[PLACEHOLDER]` below, and have
> someone with authority to represent the business review the whole thing.
> This draft is grounded in the current codebase but is not legal advice.

## Who this is

**[LEGAL ENTITY / OWNER NAME]**, operating Book-keep.
Contact: **[SUPPORT EMAIL]**

## What we collect

**Account.** Email, phone number, and username, via Firebase Authentication.

**Shop profile.** Shop name, address, phone number, JazzCash number, and shop
logo image — entered by the shop owner in Settings.

**Business records you create.** Customer and supplier names and phone
numbers, bills, purchases, item catalog entries (including item photos and
barcodes), and expenses (including receipt photos). This is the app's core
data — it's how bookkeeping works.

**Device and diagnostic data.** A push-notification token (for low-stock,
overdue-payment, and daily-summary alerts) and crash reports (device info
and stack traces) via Firebase Crashlytics, sent automatically when the app
crashes.

**AI features.** "Ask Your Shop," the AI Morning Briefing, and the AI
bill/purchase scanner send a snapshot of the relevant business data (report
figures, or a photo of a bill) to Google's Gemini API to generate an answer,
summary, or extracted line items. This data is processed by Google to
generate the response; it is not used by us or Google to train models
outside of Google's standard API terms.

## What we don't do

- We don't track your location.
- We don't use ad networks or behavioral analytics/session-replay tools.
- We don't sell your data or your customers' data to anyone.

## Where data lives

- **Database:** Neon (Postgres), a third-party cloud database provider.
- **Authentication, push notifications, crash reports, photo storage:**
  Firebase (Google).
- **AI processing:** Google Gemini API.
- **Invoice emails:** sent through the SMTP account the shop's own admin
  configures in the Admin Panel — we don't operate a mailing list, and these
  emails are one-to-one invoices/statements to your own existing customers,
  not bulk marketing.

## Your data, your customers' data

Everything you enter — customers, suppliers, bills, items — belongs to your
shop. Other shops using Book-keep cannot see it. Staff accounts you create
for your shop can see what you grant them access to, nothing more.

## Your controls

- **Export or back up your data:** Settings → Backup & Export.
- **Delete your account:** Settings → Account → Delete Account. This removes
  your sign-in credential only — it does not erase your shop's business
  records (bills, customers, items, etc.), the same way removing a staff
  member doesn't delete records they created.
- **Notifications:** can be turned off per-type in Settings → Notifications.

## Children

Book-keep is a business tool for shop owners and staff. It is not directed
at, or knowingly used by, children.

## Changes to this policy

If what we collect or where it goes changes, we'll update this page and
change the date at the top.

## Contact

Questions about this policy or your data: **[SUPPORT EMAIL]**
