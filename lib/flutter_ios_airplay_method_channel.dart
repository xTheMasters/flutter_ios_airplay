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
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }

  @override
  Future<void> playVideoFromUrl({required String url}) async {
    await methodChannel.invokeMethod<void>('playVideoFromUrl', {'url': url});
  }

  @override
  Future<void> playVideoFromAsset({required String asset}) async {
    await methodChannel.invokeMethod<void>('playVideoFromAsset', {
      'asset': asset,
    });
  }
}
