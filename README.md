# Hope Timer

Track time in specific increments across projects. Built with Flutter for Android and iOS.

## Features

- **Current** — Create timers, track elapsed time (play/pause), adjust hours, reset, and publish sessions
- **Published** — View and delete published time entries
- **Analytics** — Totals grouped by project (case-insensitive) per day, week, or month

All data is stored locally in SQLite via [Drift](https://drift.simonbinder.eu/).

## Getting started

Requires [Flutter](https://docs.flutter.dev/get-started/install).

```bash
flutter pub get
dart run build_runner build
flutter run
```

## Development

```bash
flutter analyze
flutter test
```

After changing Drift tables or DAOs, regenerate code:

```bash
dart run build_runner build
```
