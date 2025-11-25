import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_ios_airplay_method_channel.dart';

abstract class FlutterIosAirplayPlatform extends PlatformInterface {
  FlutterIosAirplayPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterIosAirplayPlatform _instance = MethodChannelFlutterIosAirplay();

  static FlutterIosAirplayPlatform get instance => _instance;

  static set instance(FlutterIosAirplayPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('getPlatformVersion() has not been implemented.');
  }

  Future<void> playVideoFromUrl({required String url}) {
    throw UnimplementedError('playVideoFromUrl() has not been implemented.');
  }

  Future<void> playVideoFromAsset({required String asset}) {
    throw UnimplementedError('playVideoFromAsset() has not been implemented.');
  }
}
