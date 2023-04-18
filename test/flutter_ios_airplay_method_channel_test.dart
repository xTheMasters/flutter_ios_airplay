import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ios_airplay/flutter_ios_airplay_method_channel.dart';

void main() {
  MethodChannelFlutterIosAirplay platform = MethodChannelFlutterIosAirplay();
  const MethodChannel channel = MethodChannel('flutter_ios_airplay');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
