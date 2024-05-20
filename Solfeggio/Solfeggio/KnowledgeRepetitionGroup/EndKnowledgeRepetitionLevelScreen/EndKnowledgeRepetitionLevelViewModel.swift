//
//  EndKnowledgeRepetitionLevelScreenViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 19.05.2024.
//

import Foundation
protocol EndKRLevelViewModelProtocol {
    func getResult() -> (Int, Int)
    func setResult(result: Int, tasksCount: Int)
}

class EndKnowledgeRepetitionLevelViewModel: EndKRLevelViewModelProtocol {
    private var result: Int = 0
    private var tasksCount: Int = 0

    func getResult() -> (Int, Int) {
        return (result, tasksCount)
    }

    func setResult(result: Int, tasksCount: Int) {
        self.result = result
        self.tasksCount = tasksCount
    }
}
