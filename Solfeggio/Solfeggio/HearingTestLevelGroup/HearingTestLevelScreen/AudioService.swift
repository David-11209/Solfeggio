//
//  AudioService.swift
//  Solfeggio
//
//  Created by Давид Васильев on 14.05.2024.
//

import AVFoundation
import UIKit

class AudioService {

    var player: AVAudioPlayer?

    func playSound() {
        guard let audioURL = Bundle.main.url(forResource: "C", withExtension: "mp3") else {
            print("Could not find audio file")
            return
        }
        do {
            let player = try AVAudioPlayer(contentsOf: audioURL)
            player.volume = 1.0
            print(player.duration)
            player.play()
            DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(1)) {
                print(player.currentTime)
            }
        } catch {
            print("Error creating audio player: \(error)")
        }
    }
}
