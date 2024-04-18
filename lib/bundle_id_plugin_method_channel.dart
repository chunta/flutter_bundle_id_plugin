import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'bundle_id_plugin_platform_interface.dart';

/// An implementation of [BundleIdPluginPlatform] that uses method channels.
class MethodChannelBundleIdPlugin extends BundleIdPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bundle_id_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getBundleIdentifier() async {
    final bundleId =
        await methodChannel.invokeMethod<String>('getBundleIdentifier');
    return bundleId;
  }
}
