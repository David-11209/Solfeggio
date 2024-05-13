//
//  EndLevelScreenViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 06.05.2024.
//

import UIKit

protocol EndLevelScreenViewModelProtocol {
    func getResult() -> Bool
    func setResult(result: Bool)
}

class EndLevelScreenViewModel: EndLevelScreenViewModelProtocol {

    private var result: Bool = false

    func getResult() -> Bool {
        return result
    }

    func setResult(result: Bool) {
        self.result = result
    }

}
