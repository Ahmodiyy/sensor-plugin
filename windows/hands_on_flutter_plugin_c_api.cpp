#include "include/hands_on_flutter_plugin/hands_on_flutter_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "hands_on_flutter_plugin.h"

void HandsOnFlutterPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  hands_on_flutter_plugin::HandsOnFlutterPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
