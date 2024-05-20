//
//  KnowledgeRepetitionLevelViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 28.03.2024.
//

import UIKit

protocol KnowledgeRepetitionLevelVMProtocol: LevelViewModelProtocol {

}

class KnowledgeRepetitionLevelViewModel: LevelViewModel, KnowledgeRepetitionLevelVMProtocol {
///массив с решеными задачами либо счетчик
    override func checkCorrectAnswer(answerName: String) {
        let tuple = getCurrentTaskWithImage()
        guard let rightAnswer = tuple.0.answers.first(where: { $0.name == answerName})?.rightAnswer else { return }
        if rightAnswer {
            answerReaction?(true)
        } else {
            answerReaction?(false)
        }
    }
}
