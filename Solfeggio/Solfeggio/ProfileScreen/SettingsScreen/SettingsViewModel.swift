//
//  SettingsViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 28.05.2024.
//

import Foundation
protocol SettingsViewModelProtocol {
    func logOut()
}
class SettingsViewModel: SettingsViewModelProtocol {

    func logOut() {
        UserDefaults.standard.set(false, forKey: "authorized")
    }
}
