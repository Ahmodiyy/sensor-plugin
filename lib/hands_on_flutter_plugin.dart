
import 'hands_on_flutter_plugin_platform_interface.dart';

class HandsOnFlutterPlugin {
  Future<String?> getPlatformVersion() {
    return HandsOnFlutterPluginPlatform.instance.getPlatformVersion();
  }
}
