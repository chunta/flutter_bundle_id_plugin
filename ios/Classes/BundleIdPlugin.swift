import Flutter
import UIKit

public class BundleIdPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "bundle_id_plugin", binaryMessenger: registrar.messenger())
    let instance = BundleIdPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "getBundleIdentifier":
      result(Bundle.main.bundleIdentifier)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
