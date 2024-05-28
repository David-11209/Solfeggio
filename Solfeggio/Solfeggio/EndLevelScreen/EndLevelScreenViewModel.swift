//
//  EndLevelScreenViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 06.05.2024.
//

import UIKit

protocol EndLevelScreenViewModelProtocol {
    func getResult() -> Bool
    func setResult(level: Level, result: Bool)
}

class EndLevelScreenViewModel: EndLevelScreenViewModelProtocol {

    private var coreDataManager: CoreDataManagerProtocol

    private var result: Bool = false

    init(coreDataManager: CoreDataManagerProtocol) {
        self.coreDataManager = coreDataManager
    }
    func getResult() -> Bool {
        return result
    }

    func setResult(level: Level, result: Bool) {
        self.result = result
        if  level.completed == false && result {
            level.completed = true
        }
        coreDataManager.saveContext()
    }

}
