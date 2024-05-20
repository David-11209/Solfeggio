//
//  EndKnowledgeRepetitionLevelScreenViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 19.05.2024.
//

import Foundation
protocol EndKnowledgeRepetitionLevelScreenViewModelProtocol {
    func getResult() -> Bool
    func setResult(result: Bool)
}

class EndKnowledgeRepetitionLevelScreenViewModel: EndKnowledgeRepetitionLevelScreenViewModelProtocol {
    private var result: Bool = false

    func getResult() -> Bool {
        return result
    }

    func setResult(result: Bool) {
        self.result = result
    }
}
