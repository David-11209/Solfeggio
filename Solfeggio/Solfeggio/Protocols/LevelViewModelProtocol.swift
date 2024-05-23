//
//  LevelViewModelProtocol.swift
//  Solfeggio
//
//  Created by Давид Васильев on 19.05.2024.
//

import UIKit

protocol LevelViewModelProtocol {
    var moveToNext: ((Float) -> Void)? { get set }
    var exitClosureWithResult: ((Int) -> Void)? { get set }
    var answerReaction: ((Bool) -> Void)? { get set }
    var tasks: [Task] { get set }
    var soundTasks: [SoundTask] { get set }
    var index: Int { get set }
    func setData(tasks: Set<Task>, dict: [String: UIImage])
    func setData(soundTask: Set<SoundTask>)
    func getCurrentTaskWithImage() -> (Task, UIImage?)
    func getCurrentSoundTask() -> SoundTask
    func getCurrentAnswers() -> [Answer]
    func checkCorrectAnswerTask(answerName: String)
    func checkCorrectAnswerSoundTask(answerName: String)
    func getNumberCompletedTasks() -> Int
    func nextSoundTask()
    func nextTask()
}
