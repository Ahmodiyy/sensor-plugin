import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'hands_on_flutter_plugin_platform_interface.dart';

/// An implementation of [HandsOnFlutterPluginPlatform] that uses method channels.
class MethodChannelHandsOnFlutterPlugin extends HandsOnFlutterPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('hands_on_flutter_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  Future<bool?> initializeBarometer() async {
    final barometer =
        await methodChannel.invokeMethod<bool>("initializeBarometer");
    return barometer;
  }

  Future<double?> getBarometer() async {
    final barometerValue =
        await methodChannel.invokeMethod<double>("getBarometer");
    return barometerValue;
  }
}
