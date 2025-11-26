import 'flutter_ios_airplay_platform_interface.dart';

/// Flutter iOS AirPlay helper API.
///
/// Provides simple static methods to play videos on iOS using the
/// native `AVPlayerViewController`, including AirPlay controls and
/// Picture in Picture when available.

class FlutterIosAirplay {
  /// Returns the native platform version string reported by the plugin.
  ///
  /// On iOS this is the system version (e.g. `17.x`).
  static Future<String?> getPlatformVersion() {
    return FlutterIosAirplayPlatform.instance.getPlatformVersion();
  }

  /// Plays a video from a network `url` using the native player UI on iOS.
  ///
  /// Throws a [PlatformException] if the URL is invalid or playback fails.
  static Future<void> url({required String url}) {
    return FlutterIosAirplayPlatform.instance.playVideoFromUrl(url: url);
  }

  /// Plays a bundled `asset` video using the native player UI on iOS.
  ///
  /// The `asset` must be declared in `pubspec.yaml` under `assets:`.
  /// Throws a [PlatformException] if the asset cannot be resolved.
  static Future<void> assets({required String asset}) {
    return FlutterIosAirplayPlatform.instance.playVideoFromAsset(asset: asset);
  }
}
