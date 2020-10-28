import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    if let plugin = self.registrar(forPlugin: "FlutterNativePlugin") {
        FlutterNativePlugin.register(with: plugin)
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
