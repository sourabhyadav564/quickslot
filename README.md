# QuickSlot 🏸⚽

> A sports slot booking mini-app built for the QuickSlot Hiring Hackathon.
> Book badminton courts and turf grounds — with **zero double-bookings, guaranteed**.

---

## Setup & Running Locally

### Prerequisites
- Node.js 20+ (installed via nvm: `nvm install 20`)
- Flutter SDK (3.x)
- Android emulator or physical device

### 1. Start the backend
```bash
cd server
npm install
node src/index.js
# API running at http://localhost:3000
```

### 2. Run the Flutter app
```bash
cd app
flutter pub get
flutter run        # on emulator/device
```

> **Note:** The app points to the deployed Railway backend by default. To run against a local server instead, update `_baseUrl` in `app/lib/core/api_client.dart` to `http://10.0.2.2:3000` (Android emulator) or your machine's LAN IP (physical device).

### Demo accounts (login screen)
| Username | Password | Name |
|----------|----------|------|
| `arjun`  | `arjun123` | Arjun Mehta |
| `priya`  | `priya123` | Priya Sharma |
| `rohan`  | `rohan123` | Rohan Das |

For curl testing, first `POST /auth/login` to get a `userId`, then pass it as `Authorization: Bearer <userId>`.

---

## Architecture

```
Swades/
├── server/          Node.js + Express + SQLite backend
│   └── src/
│       ├── db.js               SQLite init, WAL mode, seed
│       ├── app.js              Express wiring
│       ├── middleware/auth.js  Bearer token validation
│       └── routes/
│           ├── auth.js         POST /auth/login
│           ├── venues.js       GET /venues, GET /venues/:id/slots
│           └── bookings.js     POST /bookings, DELETE /bookings/:id
│                               GET /users/:id/bookings
└── app/             Flutter app
    └── lib/
        ├── core/   api_client, constants, router (GoRouter)
        ├── models/ Freezed data classes (Venue, Slot, Booking)
        ├── providers/ Riverpod providers (auth, venues, slots, bookings)
        ├── screens/   Login, VenueList, VenueDetail, MyBookings
        └── widgets/   SlotGrid, BookingCard, AppError, AppLoading
```

### Concurrency approach
SQLite with **`BEGIN IMMEDIATE` transactions**. When two requests race to book the same slot, SQLite's writer-lock ensures only one transaction commits. The loser receives `SQLITE_BUSY` which the API translates to `409 Conflict` with a human-readable message. Verified with two simultaneous `curl` requests — exactly one succeeds, every time.

### State management: Riverpod
Chosen because:
- `AsyncNotifier` keeps business logic out of widgets
- `FamilyAsyncNotifierProvider` cleanly scopes slot data per (venueId, date)
- Easy to unit-test providers without a widget tree
- Code-gen via `riverpod_generator` eliminates runtime typos

---

## Bonus Features Implemented
1. **Slot polling** — `SlotsNotifier` polls every 5 seconds; a booked slot flips to "booked" on the other phone without restarting the app.
2. **Offline read cache for My Bookings** — on successful fetch, bookings are serialized to `SharedPreferences`. On network failure, stale data is served.

---

## What I Cut and Why
- **JWT/OAuth:** Implemented username + password login with Bearer token auth. Token is the userId (no expiry) — sufficient for a demo; production would use signed JWTs.
- **Push notifications:** Polling every 5 s gives the same live-update effect without a notification service dependency.
- **Pagination on venue list:** Only 5 venues seeded; adding pagination would add complexity with no demo value.

---

## What I'd Do With One More Day
- Add WebSocket support for true instant slot updates (replace polling)
- Implement proper JWT auth with refresh tokens
- Add unit tests for the booking transaction and Riverpod providers
- Dockerize the backend (`docker-compose up` for one-command start)
- Filter slots by morning / afternoon / evening time bands

---

## AI Usage Note
**Used Claude (Antigravity) for:**
- Generating boilerplate code (models, providers, screens, Express routes)
- Debugging the Freezed v3 `@JsonKey` false-positive analyzer warning
- Writing the SQLite concurrency transaction pattern

**One thing AI got wrong that I caught and fixed:**
The initial `pubspec.yaml` had `freezed: ^2.5.7` and `freezed_annotation: ^2.4.4`, but `custom_lint ^0.7.5` requires `freezed_annotation ^3.0.0`. The pub solve failed and I debugged the version conflict, upgraded both `freezed` and `freezed_annotation` to `^3.0.0`, and downgraded `custom_lint` to `^0.7.3` to resolve it.
