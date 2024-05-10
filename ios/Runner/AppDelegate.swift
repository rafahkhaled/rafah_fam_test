import UIKit
import Flutter
import GoogleMaps
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with :self)
    GMSServices.provideAPIKey("AIzaSyCvkLrrkN-3pF3xmHN3186ZpXwdIE2IA_w")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
