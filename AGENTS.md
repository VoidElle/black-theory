# AGENTS.md – BlackTheory

Flutter security-research app that exploits vulnerabilities in the GreenTheory gym access system (CWE-798 + OWASP A01:2021). **For educational/auditing purposes only.**

---

## Architecture Overview

```
lib/
  main.dart               # App entry point – loads .env, inits SharedPrefs, NetworkHandler, Riverpod ProviderScope
  network/
    network_handler.dart  # Configures Dio (base URL from .env, PrettyDioLogger, NetworkInterceptor); registers all REST clients into RestClientsRepository
    rest/                 # Retrofit-generated REST clients (one file per endpoint + .g.dart counterpart)
  pages/                  # Two screens: QrCodePage (/) and RollingClientIdsPage (/rolling-client-ids-page)
  providers/              # All global Riverpod state (global_providers.dart + .g.dart); all providers are keepAlive: true
  repositories/
    shared_preferences_repository.dart  # Singleton SP wrapper; must call initialize() before any read/write
    rest_clients_repository.dart        # Static holder for Retrofit client instances, populated by NetworkHandler
  utils/
    global_constants.dart    # All SharedPreferences keys, .env keys, state keys, and HTTP headers
    global_colors.dart       # Neon green (#08e054) palette used throughout
    global_functions.dart    # QR payload formatter, GoRouter config, API response parser
    env_functions.dart       # Typed getters for every .env variable (throw if missing)
    shared_preferences_functions.dart  # SP reads with .env fallback; SP writes
  widgets/
    global_drawer.dart       # Left-swipe settings panel (modify fields, stealth mode, rolling client)
    actions/                 # Bottom sheets (add rolling client ID, modify QR fields)
    pages/                   # Page-scoped FABs and widgets
```

**Data flow for QR generation:**
`.env` → `EnvFunctions` → `SharedPreferencesFunctions` (SP overrides .env) → `GenerationFieldsStatus` provider → `GlobalFunctions.retrieveQrCodeData()` → `qr_flutter` renders `client_id=X&center_id=Y&time=<unix_ms>`

**Data flow for expiration check:**
`QrCodePage` reads `clientId` + `token` from provider → calls `CheckExpirationDateRestClient.checkExpirationDateOfClientId()` → result cached in `ExpirationCheckMap` provider (keyed by `int clientId`)

---

## Critical Setup

### 1. `.env` file (required – loaded as a Flutter asset)
Copy `example.env` → `.env` in the project root:
```
CLIENT_ID=50000
CENTER_ID=1747951200000
TOKEN=58565e69e046d3e0468cb273fecba690
BASE_URL=https://gym.theoryholding.com/request/
```
The `.env` file is listed as a Flutter asset in `pubspec.yaml` and loaded via `flutter_dotenv` before `runApp`. Missing keys throw at runtime.

### 2. Flutter version management via `fvm`
```bash
fvm install          # installs the pinned Flutter version
fvm flutter pub get
fvm flutter run
```
Always prefix `flutter` commands with `fvm flutter`.

---

## Code-Generation Workflow

This project uses `build_runner` for Retrofit clients, Riverpod generators, and Freezed models. After modifying any annotated file (`.g.dart` companion), regenerate:
```bash
fvm flutter pub run build_runner build --delete-conflicting-outputs
```
Files with `part 'foo.g.dart'` and `part of 'foo.dart'` are generated – **never edit `.g.dart` files manually**.

---

## Key Patterns

### Riverpod providers
All providers live in `lib/providers/global_providers.dart` with `@Riverpod(keepAlive: true)`. State mutations go through notifier methods, never directly on `state` from outside the notifier.

```dart
// Reading
ref.watch(generationFieldsStatusProvider)
// Writing
ref.read(generationFieldsStatusProvider.notifier).changeStatus(key, value)
```

### REST clients (Retrofit)
Add a new endpoint by creating `lib/network/rest/new_client.dart` annotated with `@RestApi()`, add the `part '...g.dart'` line, register the instance in `NetworkHandler` constructor, and expose it via `RestClientsRepository`.

### SharedPreferences fallback chain
Values are always read as SP → .env fallback (see `SharedPreferencesFunctions`). Writes go through `SharedPreferencesRepository` (which guards against null `_sharedPreferences`).

### Constants
All keys (SP, state, env, HTTP headers) are centralized in `GlobalConstants`. Never use string literals for keys elsewhere.

### Rolling Client mode
A list of `client_id` values stored in SP (`ROLLING_CLIENT_IDS_LIST`). When enabled, `RollingClientCurrentIndex` tracks position; a double-tap on the QR calls `next()` to cycle IDs. The mode auto-disables when the list becomes empty.

### Stealth mode
`StealthModeStatus` provider (default `true`) hides sensitive UI elements. Surfaces only through `ref.watch(stealthModeStatusProvider)` in widgets.

---

## Key Files Reference

| Purpose | File |
|---|---|
| All global state | `lib/providers/global_providers.dart` |
| All keys/constants | `lib/utils/global_constants.dart` |
| Network bootstrap | `lib/network/network_handler.dart` |
| API endpoint | `lib/network/rest/check_expiration_date_rest_client.dart` |
| QR payload builder | `lib/utils/global_functions.dart` → `retrieveQrCodeData()` |
| App colors | `lib/utils/global_colors.dart` |

