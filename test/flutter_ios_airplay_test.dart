import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ios_airplay/flutter_ios_airplay.dart';
import 'package:flutter_ios_airplay/flutter_ios_airplay_platform_interface.dart';
import 'package:flutter_ios_airplay/flutter_ios_airplay_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterIosAirplayPlatform
    with MockPlatformInterfaceMixin
    implements FlutterIosAirplayPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterIosAirplayPlatform initialPlatform =
      FlutterIosAirplayPlatform.instance;

  test('$MethodChannelFlutterIosAirplay is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterIosAirplay>());
  });

  test('getPlatformVersion', () async {
    MockFlutterIosAirplayPlatform fakePlatform =
        MockFlutterIosAirplayPlatform();
    FlutterIosAirplayPlatform.instance = fakePlatform;
  });
}
