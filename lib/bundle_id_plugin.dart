import 'bundle_id_plugin_platform_interface.dart';

class BundleIdPlugin {
  Future<String?> getPlatformVersion() {
    return BundleIdPluginPlatform.instance.getPlatformVersion();
  }

  Future<String?> getBundleIdentifier() {
    return BundleIdPluginPlatform.instance.getBundleIdentifier();
  }
}
