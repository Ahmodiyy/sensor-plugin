import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'hands_on_flutter_plugin_method_channel.dart';

abstract class HandsOnFlutterPluginPlatform extends PlatformInterface {
  /// Constructs a HandsOnFlutterPluginPlatform.
  HandsOnFlutterPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static HandsOnFlutterPluginPlatform _instance = MethodChannelHandsOnFlutterPlugin();

  /// The default instance of [HandsOnFlutterPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelHandsOnFlutterPlugin].
  static HandsOnFlutterPluginPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [HandsOnFlutterPluginPlatform] when
  /// they register themselves.
  static set instance(HandsOnFlutterPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
