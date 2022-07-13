import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hands_on_flutter_plugin/hands_on_flutter_plugin_method_channel.dart';

void main() {
  MethodChannelHandsOnFlutterPlugin platform = MethodChannelHandsOnFlutterPlugin();
  const MethodChannel channel = MethodChannel('hands_on_flutter_plugin');

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
