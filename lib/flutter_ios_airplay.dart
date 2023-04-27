import 'dart:async';
import 'package:flutter/services.dart';

class FlutterIosAirplay {
  static const MethodChannel _channel = MethodChannel('flutter_ios_airplay');

  static Future<void> url({
    required String url,
  }) async {
    Map<String, dynamic> args = {
      'url': url,
    };

    await _channel.invokeMethod('playVideoFromUrl', args);
  }
}
