import 'package:flutter_test/flutter_test.dart';
import 'package:bundle_id_plugin/bundle_id_plugin.dart';
import 'package:bundle_id_plugin/bundle_id_plugin_platform_interface.dart';
import 'package:bundle_id_plugin/bundle_id_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBundleIdPluginPlatform
    with MockPlatformInterfaceMixin
    implements BundleIdPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

    @override
  Future<String?> getBundleIdentifier() => Future.value('com.test.example');
}

void main() {
  final BundleIdPluginPlatform initialPlatform = BundleIdPluginPlatform.instance;

  test('$MethodChannelBundleIdPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBundleIdPlugin>());
  });

  test('getPlatformVersion', () async {
    BundleIdPlugin bundleIdPlugin = BundleIdPlugin();
    MockBundleIdPluginPlatform fakePlatform = MockBundleIdPluginPlatform();
    BundleIdPluginPlatform.instance = fakePlatform;

    expect(await bundleIdPlugin.getPlatformVersion(), '42');
  });

    test('getBundleIdentifier', () async {
    BundleIdPlugin bundleIdPlugin = BundleIdPlugin();
    MockBundleIdPluginPlatform fakePlatform = MockBundleIdPluginPlatform();
    BundleIdPluginPlatform.instance = fakePlatform;

    expect(await bundleIdPlugin.getBundleIdentifier(), 'com.test.example');
  });
}
