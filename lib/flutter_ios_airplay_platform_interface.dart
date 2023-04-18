import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_ios_airplay_method_channel.dart';

abstract class FlutterIosAirplayPlatform extends PlatformInterface {
  /// Constructs a FlutterIosAirplayPlatform.
  FlutterIosAirplayPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterIosAirplayPlatform _instance = MethodChannelFlutterIosAirplay();

  /// The default instance of [FlutterIosAirplayPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterIosAirplay].
  static FlutterIosAirplayPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterIosAirplayPlatform] when
  /// they register themselves.
  static set instance(FlutterIosAirplayPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
