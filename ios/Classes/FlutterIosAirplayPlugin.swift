import AVFoundation
import AVKit
import Flutter
import UIKit

public class FlutterIosAirplayPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_ios_airplay", binaryMessenger: registrar.messenger())
    let instance = FlutterIosAirplayPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "playVideoFromUrl" {
      guard let args = call.arguments as? [String: Any],
            let url = args["url"] as? String
      else {
        result(FlutterError(code: "INVALID_ARGUMENTS", message: "Invalid arguments", details: nil))
        return
      }

      // Reproduce el video desde la URL utilizando AVPlayerViewController
      let player = AVPlayer(url: URL(string: url)!)
      let playerViewController = AVPlayerViewController()
      playerViewController.player = player
      UIApplication.shared.keyWindow?.rootViewController?.present(playerViewController, animated: true) {
        playerViewController.player?.play()
        result(nil) // Éxito, no hay resultado adicional
      }
    } else if call.method == "playVideoFromAsset" {
      guard let args = call.arguments as? [String: Any],
            let assets = args["assets"] as? String
      else {
        result(FlutterError(code: "INVALID_ARGUMENTS", message: "Invalid arguments", details: nil))
        return
      }

      // Obtiene la URL del archivo en el asset
      if let assetUrl = Bundle.main.url(forResource: assets, withExtension: nil) {
        // Reproduce el video desde el asset utilizando AVPlayerViewController
        let player = AVPlayer(url: assetUrl)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        UIApplication.shared.keyWindow?.rootViewController?.present(playerViewController, animated: true) {
          playerViewController.player?.play()
          result(nil) // Éxito, no hay resultado adicional
        }
      } else {
        result(FlutterError(code: "ASSET_NOT_FOUND", message: "Asset not found", details: nil))
      }
    } else {
      result(FlutterMethodNotImplemented)
    }
  }
}
