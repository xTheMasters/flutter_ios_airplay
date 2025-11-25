import 'flutter_ios_airplay_platform_interface.dart';

class FlutterIosAirplay {
  static Future<String?> getPlatformVersion() {
    return FlutterIosAirplayPlatform.instance.getPlatformVersion();
  }

  static Future<void> url({required String url}) {
    return FlutterIosAirplayPlatform.instance.playVideoFromUrl(url: url);
  }

  static Future<void> assets({required String asset}) {
    return FlutterIosAirplayPlatform.instance.playVideoFromAsset(asset: asset);
  }
}
