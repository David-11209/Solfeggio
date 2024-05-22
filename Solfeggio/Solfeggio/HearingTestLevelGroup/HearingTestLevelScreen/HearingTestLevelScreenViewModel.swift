//
//  HearingTestLevelScreenViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 28.03.2024.
//

import UIKit

protocol HearingTestLevelScreenViewModelProtocol: LevelViewModelProtocol {
    func playSound()
}

class HearingTestLevelScreenViewModel: LevelViewModel, HearingTestLevelScreenViewModelProtocol {
    var audioService: AudioServiceProtocol

    init(audioService: AudioServiceProtocol) {
        self.audioService = audioService
    }

    func playSound() {
        audioService.playSound(soundName: getCurrentSoundTask().soundName)
    }
}
