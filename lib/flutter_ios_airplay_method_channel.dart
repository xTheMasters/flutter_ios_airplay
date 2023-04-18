import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_ios_airplay_platform_interface.dart';

/// An implementation of [FlutterIosAirplayPlatform] that uses method channels.
class MethodChannelFlutterIosAirplay extends FlutterIosAirplayPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_ios_airplay');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
