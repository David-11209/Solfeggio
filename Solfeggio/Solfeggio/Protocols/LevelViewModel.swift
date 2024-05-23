//
//  LevelViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 20.05.2024.
//

import UIKit

class LevelViewModel: LevelViewModelProtocol {
    var tasks: [Task]
    var soundTasks: [SoundTask]
    var index = 0
    private var numberCompletedTasks = 0
    private var tasksCount = 0
    private var imageDict: [String: UIImage]
    var moveToNext: ((Float) -> Void)?
    var exitClosureWithResult: ((Int) -> Void)?
    var answerReaction: ((Bool) -> Void)?

    init() {
        tasks = []
        soundTasks = []
        imageDict = [:]
    }

    func setData(tasks: Set<Task>, dict: [String: UIImage]) {
        self.tasks = Array(tasks)
        self.tasksCount = tasks.count
        self.imageDict = dict
    }

    func setData(soundTask: Set<SoundTask>) {
        self.soundTasks = Array(soundTask)
        self.tasksCount = soundTask.count
    }

    func getCurrentTaskWithImage() -> (Task, UIImage?) {
        return (tasks[index], imageDict[tasks[index].image])
    }

    func getCurrentSoundTask() -> SoundTask {
        return (soundTasks[index])
    }

    func getCurrentAnswers() -> [Answer] {
        if soundTasks.isEmpty {
            let answers = tasks[index].answers
            return Array(answers)
        } else {
            let answers = soundTasks[index].answers
            return Array(answers)
        }
    }

    func getNumberCompletedTasks() -> Int {
        return numberCompletedTasks
    }

    func checkCorrectAnswerTask(answerName: String) {
        let tuple = getCurrentTaskWithImage()
        guard let rightAnswer = tuple.0.answers.first(where: { $0.name == answerName})?.rightAnswer else { return }
        if rightAnswer {
            numberCompletedTasks += 1
            answerReaction?(true)
        } else {
            answerReaction?(false)
        }
    }

    func checkCorrectAnswerSoundTask(answerName: String) {
        let soundTask = getCurrentSoundTask()
        guard let rightAnswer = soundTask.answers.first(where: { $0.name == answerName})?.rightAnswer else { return }
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

    func nextSoundTask() {
        if index == soundTasks.count - 1 {
            exitClosureWithResult?(numberCompletedTasks)
        } else {
            index += 1
            moveToNext?(Float(index) / Float(soundTasks.count))
        }
    }
}
