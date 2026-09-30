# Hardware Store Book Keeper — Design Brief

This is a **retroactive** design brief, not a pre-build spec — the app
already exists and this documents its actual, current design system as
built, so future work has one place to check "does this already exist"
before inventing a new pattern. Functional requirements per feature live
in `docs/PRD.md` §5; this file covers presentation only (tokens, shared
components, screen inventory, states, accessibility) — the split PRD.md
itself already uses ("presentation-only changes aren't functional
requirements").

## 1. Design Tokens

Defined once in `lib/main.dart`'s `ThemeData`/`darkTheme` blocks — every
screen inherits from these, nothing hardcodes its own colors/radii.

### Color

| Token | Light | Dark |
|---|---|---|
| Primary ("Harbor Teal" / warm coral) | `#0F766E` | `#FF7E45` |
| Secondary | `#F59E0B` (amber) | `#C2410C` (burnt rust) |
| Scaffold background | `#FAF7F1` (warm ivory) | `#1B1512` (warm dark brown) |
| Card surface | white | `#261D18` |
| App bar | primary | `#8A3010` |

Both themes are seeded via `ColorScheme.fromSeed` (Material 3) rather than
every color hand-picked — secondary/tertiary shades derive from the seed.

Semantic colors used ad hoc, not tokenized (each screen picks the
Material shade directly): `Colors.red.shade600`/`Colors.green.shade600`
for danger/success, `AppStyle.creditColor()` for the one graduated
green→amber→red signal (credit-limit usage), `AppStyle.colorForKey()`
for a stable pastel-palette hash (category chips/avatars — 7-color
`categoryPalette`).

### Shape & Elevation

| Token | Value |
|---|---|
| Card radius | 20px, elevation 0 (flat, not shadowed — see "Elevation" below) |
| Text-field radius | 16px, filled (`black`/`white` @ 4–6% alpha), no border |
| Buttons/chips | `StadiumBorder` (full pill) everywhere — no rectangular buttons |
| Popup menus (⋮ action sheets) | 16px radius, elevation 12 — themed once app-wide via `popupMenuTheme`, not per-screen |

Cards use `AppStyle.raisedShadow()` (a custom dual soft-shadow — colored
glow below-right + light highlight above-left) instead of Material's flat
elevation, to read as "physically raised" rather than a hard drop shadow.

### Typography

No custom type scale — Material 3's default type scale, inherited from
`ThemeData`. The one deliberate exception (a decorative script font for a
"Good morning/afternoon" greeting) was tried and **removed** — see
`bookkeeper-app-status` history — so there is currently no secondary
display font anywhere in the app; treat any request to add one as new
scope, not a gap.

### Increase Contrast (real, wired-up a11y token)

Both themes run every hand-picked accent through
`darkenForContrast()`/`AppStyle.highContrastFill()`, which checks
`MediaQuery.highContrastOf(context)` and darkens by blending 25–35%
toward black — so a user with the system's Increase Contrast setting on
gets real extra contrast, not just "hopefully good enough." Apply this
same pattern to any new hardcoded accent color.

## 2. Component Inventory

All in `lib/widgets/app_style.dart` unless noted. Reuse these before
building a new one-off widget.

| Component | Purpose |
|---|---|
| `AppCard` / `AppListCard` | The standard content card — everything sits inside one of these, never a bare `Card`/`ListTile`. |
| `IconBadge` | Circular tinted icon badge used as a card/row's leading visual (stat cards, list rows, section headers). |
| `GradientButton` | The one primary-CTA button style app-wide — pulls from `colorScheme.primary`, not a hardcoded gradient (a bespoke violet/pink gradient button was tried and explicitly reverted for this reason). |
| `CategoryChip` | Filter chip using `AppStyle.colorForKey()`'s stable pastel hash. |
| `AvatarListRow` | Standard list row: avatar + name/subtitle + optional trailing `sideAction` (call/WhatsApp) + optional `ringColor` (over-limit warning ring). |
| `FloatingOrb` / `AuthHeroBackdrop` | Drifting-orb ambient animation behind hero banners (Home, Settings, Auth) — the app's one recurring "alive" motion motif. `FloatingOrb` itself is only used inside `AuthHeroBackdrop` (Home/Settings each reimplement their own inline orb instead — documented in-code why `FloatingOrb`'s `Positioned`-returning shape doesn't fit those call sites); don't delete it as apparently-dead without checking `AuthHeroBackdrop` first. |
| `FloatingAppBar` | The single brand app bar (not per-section bars — a redundant second app-bar was removed app-wide). |
| `EatingDeleteButton` / `AnimatedCancelButton` | The shared destructive-confirm dialog pair — every delete confirmation app-wide uses these two, not a plain `AlertDialog`. |
| `Pressable` / `AppIconButton` | Tap-scale wrapper + icon button, used instead of bare `GestureDetector`/`IconButton` where a press-feedback affordance matters. |
| `GlassContainer` | Translucent glass-panel effect (bottom nav, some overlays). |
| `GlassSearchBar` | The one search-field style app-wide — pill-shaped glass field with a focus glow, pop+rotate search icon, and animated clear button. Used by Settings, Customers, Suppliers, Items, Language, and Update Stock (Search screen is the one exception — its search field is embedded in a `FloatingAppBar` title, a structurally different context). |
| `SkeletonPulse` / `SkeletonListLoader` | The loading-state placeholder — see States below. |
| `errorRetry()` | The failed-state placeholder — see States below. |
| `contactSideAction()` | Call + WhatsApp icon pair, shared between customer/supplier rows (was duplicated, now one function). |
| `PaidStampOverlay` (`paid_stamp_overlay.dart`) | One-shot celebratory "PAID" stamp animation on a bill/purchase card, unpaid→paid transition only. |
| `formatMoney()` (`money.dart`) | The only sanctioned way to render a currency amount — every screen routes through this, not ad hoc `"Rs $x"` string literals (several past bugs were exactly this shortcut missed in a sweep). |

## 3. States

Every data-driven screen follows the same four-state contract:

- **Loading:** `SkeletonPulse`/`SkeletonListLoader` — a shimmer placeholder shaped like the real content, not a spinner, so the layout doesn't jump when data arrives.
- **Empty:** a muted icon (search-off / inventory-box style) + one line of text — no bare blank space.
- **Error:** `errorRetry(message, onRetry)` — centered message + an outlined Retry button. Critically, **only a field/screen that has never successfully loaded once may show this** — a background refresh failing after a successful load must never regress the screen back to an error state and erase what's already on screen (see `home_screen.dart`'s `_fetchField` for the reference implementation of this rule: `_failedFields`/`_loadedFields` are two separate sets, and success removes from failed but nothing ever removes from loaded).
- **Success:** the real content, each independently-loaded section (Home dashboard fields, in particular) rendering as soon as *its own* request resolves rather than gating on every request finishing.

This is a genuine invariant, not just a style preference — treat any new
data-fetching screen as needing all four states before calling it done.

## 4. Screen Inventory

Grouped by the six bottom-nav destinations (`main_nav_screen.dart`); each
tab's IndexedStack keeps its screens alive rather than rebuilding on
every tab switch. The selected tab's icon sits on a strong
highlight-to-full-saturation gradient circle (single accent color, not
two-tone — a teal/orange two-tone version was tried and dropped as not
fitting) with a white ring and colored glow, not a flat fill.

Home's Overview stat row is one hero card (Sales, full-size figure +
sparkline) with the other three stats (Outstanding, Profit, Cash Today)
folded in as a tinted mini-stat strip along the bottom, rather than four
equal-size cards — see `_heroStatCard`/`_miniStat` in `home_screen.dart`.

| Nav tab | Screens reached from it |
|---|---|
| **Home** | `home_screen` (dashboard: Overview/Stock/Money), `add_bill_screen`, `scan_bill_screen`, `add_customer_screen` (Walk-in shortcut), search (`search_screen`, FAB), "Ask Your Shop" (bottom sheet, not a separate screen) |
| **Customers** | `customer_list_screen`, `customer_detail_screen`, `add_customer_screen`, `dues_screen` |
| **Items** | `items_screen`, `bulk_add_items_screen`, `barcode_scanner_screen`, `update_stock_screen` |
| **Suppliers** | `supplier_list_screen`, `supplier_detail_screen`, `add_supplier_screen`, `add_purchase_screen`, `scan_purchase_screen`, `supplier_dues_screen` |
| **Reports** | `reports_screen` (hub), `gst_report_screen`, `stock_valuation_screen`, `profit_by_item_screen`, `reconciliation_screen`, `expenses_screen`, `activity_log_screen` |
| **Settings** | `settings_screen` (hub, collapsible sections), `account_screen`, `notifications_screen`, `language_screen`, `backup_screen`, `admin_screen`, `privacy_policy_screen` (Account section) |

Not reached from bottom nav: `auth/` screens (login/signup/reset, shown
pre-`AuthGate`).

## 5. Primary User Flows

High-level only — step-by-step detail lives in PRD.md §5 per feature.

1. **Auth → Home:** cold start → `AuthGate` (boot splash) → signed-in check → Home dashboard, OR sign-in/sign-up if not authenticated.
2. **Record a sale:** Home → New Bill (typed) or Scan Bill (photo → AI-extracted review screen) → resolve/create customer inline → save → dashboard refreshes.
3. **Record a purchase:** Suppliers tab (or Home) → Add Purchase / Scan Purchase → resolve/create supplier inline → save.
4. **Chase a due:** Home's Outstanding card or Customers tab → Dues Center → per-customer reminder (SMS/WhatsApp) or mark paid (triggers `PaidStampOverlay`).
5. **Check the books:** Reports hub → drill into any of the 6 report screens, each independently loaded.
6. **Admin/ops:** Settings → collapsible sections (Shop Profile/Appearance/Insights/Inventory/Tools & Sync/Account) → Admin panel (server health, backup/restore, staff/admin management) for admin accounts only.

## 6. Accessibility Notes

Real, already-implemented — not aspirational:

- **Increase Contrast** respected app-wide (see Tokens above), not just on text — accent colors used as *backgrounds* (buttons, app bars) also darken, since that's where a hardcoded accent most easily fails a contrast check.
- **Minimum tap targets**: Settings' section-header rows were audited and bumped from ~34dp to ~48dp after a design-review pass flagged them as under the accessibility minimum — treat 48dp as the floor for any new tappable row, not just header rows.
- **High-contrast avatar fill**: `AppStyle.highContrastFill()` darkens a pastel avatar-circle specifically when Increase Contrast is on, so the black87 initial text drawn over it stays legible (a pastel fill alone can wash out dark text at default contrast).
- **Negative-margin hit-testing pitfall** (a real bug caught here, not hypothetical): a `Container` given a *negative* horizontal margin to bleed a color wash past `ListTile`'s default insets silently broke that row's entire tap handling, no exception thrown, `flutter analyze` clean throughout. Treat a negative margin inside any tap-target container as a hit-testing risk to test on-device, not just visually.
- **Not yet audited**: screen-reader label coverage (`Semantics`/`excludeSemantics` usage) and color-contrast ratios for text-on-tint combinations haven't had a dedicated pass — flag if a future task touches either.
