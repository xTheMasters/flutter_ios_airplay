import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_ios_airplay_method_channel.dart';

/// Platform interface for the Flutter iOS AirPlay plugin.
///
/// Implementations must extend this class and provide the concrete
/// behaviors for invoking native playback from URL or asset.
abstract class FlutterIosAirplayPlatform extends PlatformInterface {
  /// Creates a new platform interface instance with token verification.
  FlutterIosAirplayPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterIosAirplayPlatform _instance = MethodChannelFlutterIosAirplay();

  /// The active platform implementation.
  static FlutterIosAirplayPlatform get instance => _instance;

  static set instance(FlutterIosAirplayPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Returns the native platform version string.
  Future<String?> getPlatformVersion() {
    throw UnimplementedError('getPlatformVersion() has not been implemented.');
  }

  /// Plays a video from the given network `url` using native UI.
  Future<void> playVideoFromUrl({required String url}) {
    throw UnimplementedError('playVideoFromUrl() has not been implemented.');
  }

  /// Plays a bundled app `asset` video using native UI.
  Future<void> playVideoFromAsset({required String asset}) {
    throw UnimplementedError('playVideoFromAsset() has not been implemented.');
  }
}
