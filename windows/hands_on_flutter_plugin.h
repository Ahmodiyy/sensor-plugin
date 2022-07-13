#ifndef FLUTTER_PLUGIN_HANDS_ON_FLUTTER_PLUGIN_H_
#define FLUTTER_PLUGIN_HANDS_ON_FLUTTER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace hands_on_flutter_plugin {

class HandsOnFlutterPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  HandsOnFlutterPlugin();

  virtual ~HandsOnFlutterPlugin();

  // Disallow copy and assign.
  HandsOnFlutterPlugin(const HandsOnFlutterPlugin&) = delete;
  HandsOnFlutterPlugin& operator=(const HandsOnFlutterPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace hands_on_flutter_plugin

#endif  // FLUTTER_PLUGIN_HANDS_ON_FLUTTER_PLUGIN_H_
