# xkcd_comics_viewer

## Getting Started

### 1. Get dependencies
`flutter pub get`

### 2. Prepare all the generated files:
Generate REST client, test mocks, MobX stores, Hive classes:
`flutter pub run build_runner build watch --delete-conflicting-outputs`

Generate easy_localization translations
`flutter pub run easy_localization:generate --source-dir ./assets/translations`

Generate easy_localization keys
`flutter pub run easy_localization:generate --source-dir ./assets/translations -f keys -o locale_keys.g.dart`

### 3. Run unit, widget tests
`flutter test`

### 4. Run the app
Debug mode:
`flutter run --debug`

Release mode (not working on emulators!):
`flutter run --release`