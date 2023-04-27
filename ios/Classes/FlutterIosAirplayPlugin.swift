import AVFoundation
import AVKit
import Flutter
import UIKit

public class FlutterIosAirplayPlugin: NSObject, FlutterPlugin {
    var playerViewController: AVPlayerViewController?
    var playerLayer: AVPlayerLayer?
    var isPlayingInPIP = false

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

            let player = AVPlayer(url: URL(string: url)!)
            playerViewController = AVPlayerViewController()
            playerViewController?.player = player
            playerViewController?.videoGravity = .resizeAspectFill
            UIApplication.shared.keyWindow?.rootViewController?.present(playerViewController!, animated: true) {
                self.playerViewController?.player?.play()
                result(nil)
            }
        } else if call.method == "playVideoFromAsset" {
            // Código para reproducir video desde el asset
        } else if call.method == "enablePictureInPicture" {
            guard let playerViewController = playerViewController else {
                result(FlutterError(code: "NO_VIDEO_PLAYING", message: "No video playing", details: nil))
                return
            }
            playerViewController.allowsPictureInPicturePlayback = true
            playerViewController.delegate = self
            if isPlayingInPIP {
                playerViewController.exitsFullScreenWhenPlaybackEnds = false
            }
            result(nil)
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
}

extension FlutterIosAirplayPlugin: AVPlayerViewControllerDelegate {
    public func playerViewController(_: AVPlayerViewController, willBeginFullScreenPresentationWithAnimationCoordinator _: UIViewControllerTransitionCoordinator) {
        isPlayingInPIP = true
    }

    public func playerViewController(_: AVPlayerViewController, willEndFullScreenPresentationWithAnimationCoordinator _: UIViewControllerTransitionCoordinator) {
        isPlayingInPIP = false
    }
}
