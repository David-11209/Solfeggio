//
//  HearingTestLevelScreenViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 28.03.2024.
//

import UIKit

protocol HearingTestLevelScreenViewModelProtocol {
    func playSound()
}

class HearingTestLevelScreenViewModel: HearingTestLevelScreenViewModelProtocol {

    var audioService: AudioService = AudioService()

    func playSound() {
        audioService.playSound()
    }
}
