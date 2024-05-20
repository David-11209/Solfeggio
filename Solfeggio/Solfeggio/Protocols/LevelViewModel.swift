//
//  LevelViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 20.05.2024.
//

import UIKit

class LevelViewModel: LevelViewModelProtocol {
    var tasks: [Task]
    var index = 0
    private var numberCompletedTasks = 0
    private var tasksCount = 0
    private var imageDict: [String: UIImage]
    var moveToNext: ((Float) -> Void)?
    var exitClosureWithResult: ((Int) -> Void)?
    var answerReaction: ((Bool) -> Void)?

    init() {
        tasks = []
        imageDict = [:]
    }

    func setData(tasks: Set<Task>, dict: [String: UIImage]) {
        self.tasks = Array(tasks)
        self.tasksCount = tasks.count
        self.imageDict = dict
    }

    func getCurrentTaskWithImage() -> (Task, UIImage?) {
        return (tasks[index], imageDict[tasks[index].image])
    }

    func getCurrentAnswers() -> [Answer] {
        let answers = tasks[index].answers
        return Array(answers)
    }

    func getNumberCompletedTasks() -> Int {
        return numberCompletedTasks
    }

    func checkCorrectAnswer(answerName: String) {
        let tuple = getCurrentTaskWithImage()
        guard let rightAnswer = tuple.0.answers.first(where: { $0.name == answerName})?.rightAnswer else { return }
        if rightAnswer {
            numberCompletedTasks += 1
            answerReaction?(true)
        } else {
            answerReaction?(false)
        }
    }

    func nextTask() {
        if index == tasks.count - 1 {
            exitClosureWithResult?(numberCompletedTasks)
        } else {
            index += 1
            moveToNext?(Float(index) / Float(tasks.count))
        }
    }
}
