import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playerVideo(fileName: String, fileFormat: String) -> AVPlayer {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat) else {
        fatalError("Failed to find \(fileName) for video player")
    }
    let player = AVPlayer(url: url)
    videoPlayer = player
    player.play()
    return player
}
