//
//  LessonLevelViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 15.04.2024.
//

import UIKit

protocol LessonLevelViewModelProtocol {
    var moveToNext: ((Float, Int) -> Void)? { get set }
    func setData(tasks: Set<Task>, dict: [String: UIImage])
    func getCurrentTaskWithImage() -> (Task, UIImage?)
    func getCurrentAnswers() -> [Answer]
    func checkCorrectAnswer(answerName: String)
    var exitClosure: ((Bool) -> Void)? { get set }
    var answerReaction: ((Bool) -> Void)? { get set }
    func nextTask()
}

class LessonLevelViewModel: LessonLevelViewModelProtocol {

    private var tasks: [Task]
    private var index = 0
    private var countHP = 3
    private var imageDict: [String: UIImage]
    var moveToNext: ((Float, Int) -> Void)?
    var exitClosure: ((Bool) -> Void)?
    var answerReaction: ((Bool) -> Void)?

    init() {
        tasks = []
        imageDict = [:]
    }

    func setData(tasks: Set<Task>, dict: [String: UIImage]) {
        self.tasks = Array(tasks)
        self.imageDict = dict
    }

    func getCurrentTaskWithImage() -> (Task, UIImage?) {
        return (tasks[index], imageDict[tasks[index].image])
    }

    func getCurrentAnswers() -> [Answer] {
        let answers = tasks[index].answers
        return Array(answers)
    }

    func checkCorrectAnswer(answerName: String) {
        let tuple = getCurrentTaskWithImage()
        guard let rightAnswer = tuple.0.answers.first(where: { $0.name == answerName})?.rightAnswer else { return }
        if rightAnswer {
            answerReaction?(true)
//            nextTask()
        } else {
            answerReaction?(false)
            countHP -= 1
        }
    }

    func nextTask() {
        if index == tasks.count - 1 {
            exitClosure?(true)
        } else if countHP == 0 {
            exitClosure?(false)
        }
        else {
            index += 1
            moveToNext?(Float(index) / Float(tasks.count), countHP)
        }
    }
}
