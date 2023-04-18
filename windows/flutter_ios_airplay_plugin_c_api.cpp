#include "include/flutter_ios_airplay/flutter_ios_airplay_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_ios_airplay_plugin.h"

void FlutterIosAirplayPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_ios_airplay::FlutterIosAirplayPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
