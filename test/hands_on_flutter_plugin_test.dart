import 'package:flutter_test/flutter_test.dart';
import 'package:hands_on_flutter_plugin/hands_on_flutter_plugin.dart';
import 'package:hands_on_flutter_plugin/hands_on_flutter_plugin_platform_interface.dart';
import 'package:hands_on_flutter_plugin/hands_on_flutter_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHandsOnFlutterPluginPlatform 
    with MockPlatformInterfaceMixin
    implements HandsOnFlutterPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final HandsOnFlutterPluginPlatform initialPlatform = HandsOnFlutterPluginPlatform.instance;

  test('$MethodChannelHandsOnFlutterPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelHandsOnFlutterPlugin>());
  });

  test('getPlatformVersion', () async {
    HandsOnFlutterPlugin handsOnFlutterPlugin = HandsOnFlutterPlugin();
    MockHandsOnFlutterPluginPlatform fakePlatform = MockHandsOnFlutterPluginPlatform();
    HandsOnFlutterPluginPlatform.instance = fakePlatform;
  
    expect(await handsOnFlutterPlugin.getPlatformVersion(), '42');
  });
}
