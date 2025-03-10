//
//  videoPlayerHelper.swift
//  Jungle
//
//  Created by Rahul choudhary on 08/03/25.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(filename :String,format :String) -> AVPlayer {
    if Bundle.main.url(forResource: filename, withExtension: format) != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: filename, withExtension: format)! )
        videoPlayer?.play()
    }
    return videoPlayer!
}
