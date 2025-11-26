![Pub Version](https://img.shields.io/pub/v/flutter_ios_airplay.svg)
![Pub Points](https://img.shields.io/pub/points/flutter_ios_airplay)
![Popularity](https://img.shields.io/pub/popularity/flutter_ios_airplay)
![Likes](https://img.shields.io/pub/likes/flutter_ios_airplay)

## Features

- Play video from URL using native `AVPlayerViewController` on iOS
- Play video from asset with robust bundle asset resolution
- Native AirPlay controls via iOS player UI
- Picture in Picture support (iOS 13+; auto inline on iOS ≥ 14.2)
- Audio session configured for playback and speaker output
- UIScene lifecycle compatibility (modern iOS apps)
- Simple static API: `FlutterIosAirplay.url(...)` and `FlutterIosAirplay.assets(...)`

## API

- `FlutterIosAirplay.getPlatformVersion()` returns the native platform version.
- `FlutterIosAirplay.url({required String url})` plays a video from a URL.
- `FlutterIosAirplay.assets({required String assets})` plays a bundled asset video.

## Usage

### Installation

Add to your project:

```
flutter pub add flutter_ios_airplay
```

### iOS requirements

- Minimum iOS 13.0.
- Enable Background Modes → Audio, AirPlay, and Picture in Picture in your iOS target.
- Picture in Picture auto-from-inline requires iOS 14.2+.

### Play a video

```dart
import 'package:flutter_ios_airplay/flutter_ios_airplay.dart';

// From URL
await FlutterIosAirplay.url(url: 'https://example.com/video.mp4');

// From asset (remember to declare it in your app's pubspec.yaml)
await FlutterIosAirplay.assets(asset: 'assets/sample.mp4');

```

### Notes

- Methods throw `PlatformException` if input is invalid or playback fails.
 
-
## Changelog

See `CHANGELOG.md` for release notes.

## Support

If this plugin helps you, consider supporting the project:

# Buy me a :coffee: !!

((More coffee == more code) == faster updates)

[![Donate](https://themonstersapp.com/images/Donate-PayPal-green.svg)](https://paypal.me/jjsd)
