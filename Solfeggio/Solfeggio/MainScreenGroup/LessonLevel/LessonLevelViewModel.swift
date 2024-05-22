//
//  LessonLevelViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 15.04.2024.
//

import UIKit

protocol LessonLevelViewModelProtocol: LevelViewModelProtocol {
    var moveToNextWithHP: ((Float, Int) -> Void)? { get set }
    var exitClosure: ((Bool) -> Void)? { get set }
}

class LessonLevelViewModel: LevelViewModel, LessonLevelViewModelProtocol {
    var exitClosure: ((Bool) -> Void)?
    var moveToNextWithHP: ((Float, Int) -> Void)?

    private var countHP = 3
    override func checkCorrectAnswerTask(answerName: String) {
        let tuple = getCurrentTaskWithImage()
        guard let rightAnswer = tuple.0.answers.first(where: { $0.name == answerName})?.rightAnswer else { return }
        if rightAnswer {
            answerReaction?(true)
        } else {
            answerReaction?(false)
            countHP -= 1
        }
    }

    override func nextTask() {
        if index == tasks.count - 1 {
            exitClosure?(true)
        } else if countHP == 0 {
            exitClosure?(false)
        } else {
            index += 1
            moveToNextWithHP?(Float(index) / Float(tasks.count), countHP)
        }
    }
}
