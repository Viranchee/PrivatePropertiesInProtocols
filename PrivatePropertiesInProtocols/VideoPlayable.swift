//
//  VideoPlayable.swift
//  PrivatePropertiesInProtocols
//
//  Created by Viranchee L on 22/01/20.
//  Copyright © 2020 Viranchee L. All rights reserved.
//

import UIKit
import AVFoundation

struct VideoPlayerOptions {
    var isMuted: Bool
    var startTime: CMTime
}

extension AVPlayer {
    var options: VideoPlayerOptions {
        get {
            return VideoPlayerOptions(isMuted: isMuted, startTime: currentTime())
        }
        set {
            self.isMuted = newValue.isMuted
            currentItem?.seek(to: newValue.startTime, completionHandler: nil)
        }
    }
}

protocol VideoPlayable {
    func startPlayback(with options: VideoPlayerOptions?)
    @discardableResult func stopPlayback() -> VideoPlayerOptions
}

protocol AVVideoPlayable: VideoPlayable {
    var player: AVPlayer { get }
}

extension AVVideoPlayable {
    func startPlayback(with options: VideoPlayerOptions?) {
        if let options = options {
            player.options = options
        }
        player.play()
    }
    
    func stopPlayback() -> VideoPlayerOptions {
        player.pause()
        return player.options
    }
}
