import Flutter
import UIKit
import FBSDKCoreKit

public class ApphudFacebookSdkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "com.apphud/apphud_facebook_sdk", binaryMessenger: registrar.messenger())
    let instance = ApphudFacebookSdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getFacebookData":
        let anonId = AppEvents.shared.anonymousID
        let extInfo = _AppEventsDeviceInfo.shared.encodedDeviceInfo
        result(["anon_id": anonId, "ext_info": extInfo])
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
