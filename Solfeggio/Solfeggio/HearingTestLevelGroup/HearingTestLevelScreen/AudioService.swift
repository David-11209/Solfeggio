//
//  AudioService.swift
//  Solfeggio
//
//  Created by Давид Васильев on 14.05.2024.
//

import AVFoundation
import UIKit
protocol AudioServiceProtocol {
    func playSound(soundName: String)
}

class AudioService: AudioServiceProtocol {

    var player: AVAudioPlayer?

    func playSound(soundName: String) {
        guard let audioURL = Bundle.main.url(forResource: soundName, withExtension: "mp3") else {
            print("Could not find audio file")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: audioURL)
            player?.volume = 1.0
            player?.prepareToPlay()
            player?.play()
        } catch {
            print("Error creating audio player: \(error)")
        }
    }
}
