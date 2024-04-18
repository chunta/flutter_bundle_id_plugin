import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'bundle_id_plugin_method_channel.dart';

abstract class BundleIdPluginPlatform extends PlatformInterface {
  /// Constructs a BundleIdPluginPlatform.
  BundleIdPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static BundleIdPluginPlatform _instance = MethodChannelBundleIdPlugin();

  /// The default instance of [BundleIdPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelBundleIdPlugin].
  static BundleIdPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BundleIdPluginPlatform] when
  /// they register themselves.
  static set instance(BundleIdPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getBundleIdentifier() {
    throw UnimplementedError('getBundleIdentifier() has not been implemented.');
  }
}
