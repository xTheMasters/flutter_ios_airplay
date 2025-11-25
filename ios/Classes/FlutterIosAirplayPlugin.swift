import AVFoundation
import AVKit
import Flutter
import UIKit

public class FlutterIosAirplayPlugin: NSObject, FlutterPlugin {
  private let registrar: FlutterPluginRegistrar

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
        name: "flutter_ios_airplay",
        binaryMessenger: registrar.messenger()
    )
    let instance = FlutterIosAirplayPlugin(registrar: registrar)
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  init(registrar: FlutterPluginRegistrar) {
    self.registrar = registrar
    super.init()
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {

    case "getPlatformVersion":
      result(UIDevice.current.systemVersion)

    // ------------------------------------------------------------
    // PLAY VIDEO FROM URL
    // ------------------------------------------------------------
    case "playVideoFromUrl":
      guard let args = call.arguments as? [String: Any],
            let urlString = args["url"] as? String,
            let videoURL = URL(string: urlString) else {

        result(FlutterError(
            code: "INVALID_ARGUMENTS",
            message: "Invalid arguments",
            details: nil
        ))
        return
      }

      playVideo(url: videoURL, result: result)

    // ------------------------------------------------------------
    // PLAY VIDEO FROM ASSET
    // ------------------------------------------------------------
    case "playVideoFromAsset":
      guard let args = call.arguments as? [String: Any],
            let assetPath = args["asset"] as? String else {

        result(FlutterError(
            code: "INVALID_ARGUMENTS",
            message: "Missing or invalid 'asset' argument",
            details: nil
        ))
        return
      }

      let key = registrar.lookupKey(forAsset: assetPath)

      guard let fullPath = Bundle.main.path(forResource: key, ofType: nil) else {
        result(FlutterError(
            code: "ASSET_NOT_FOUND",
            message: "Asset not found",
            details: assetPath
        ))
        return
      }

      let url = URL(fileURLWithPath: fullPath)
      playVideo(url: url, result: result)

    default:
      result(FlutterMethodNotImplemented)
    }
  }

  // ------------------------------------------------------------
  // Reusable player function
  // ------------------------------------------------------------
  private func playVideo(url: URL, result: @escaping FlutterResult) {
    let player = AVPlayer(url: url)
    player.isMuted = false
    player.volume = 1.0

    let playerVC = AVPlayerViewController()
    playerVC.player = player
    playerVC.allowsPictureInPicturePlayback = true

    if #available(iOS 14.2, *) {
      playerVC.canStartPictureInPictureAutomaticallyFromInline = true
    }

    DispatchQueue.main.async {
      try? AVAudioSession.sharedInstance().setCategory(.playback, mode: .moviePlayback, options: [.defaultToSpeaker])
      try? AVAudioSession.sharedInstance().setActive(true)

      let rootVC = UIApplication.shared.connectedScenes
        .compactMap { $0 as? UIWindowScene }
        .flatMap { $0.windows }
        .first { $0.isKeyWindow }?.rootViewController

      self.getTopViewController(from: rootVC)?.present(playerVC, animated: true) {
        player.play()
        result(nil)
      }
    }
  }

  // ------------------------------------------------------------
  // Get current visible ViewController
  // ------------------------------------------------------------
  private func getTopViewController(from root: UIViewController?) -> UIViewController? {
    guard let root = root else { return nil }
    var top = root
    while let presented = top.presentedViewController {
      top = presented
    }
    return top
  }
}
