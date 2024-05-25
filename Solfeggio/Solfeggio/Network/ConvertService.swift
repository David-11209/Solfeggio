//
//  ConvertService.swift
//  Solfeggio
//
//  Created by Давид Васильев on 04.05.2024.
//

import CoreData

protocol ConvertServiceProtocol {
    func convertDataToCoreData(jsonData: JSONData)
}

class ConvertService: ConvertServiceProtocol {

    private var coreDataManager: CoreDataManagerProtocol
    private var viewContext: NSManagedObjectContext
    init(coreDataManager: CoreDataManagerProtocol) {
        self.coreDataManager = coreDataManager
        self.viewContext = coreDataManager.getViewContext()
    }

    func convertDataToCoreData(jsonData: JSONData) {
        for blockData in jsonData.blocks {
            let block = Block(context: viewContext)
            block.name = blockData.name

            for themeData in blockData.themes {
                let theme = Theme(context: viewContext)
                theme.name = themeData.name

                for levelData in themeData.levels {
                    let level = Level(context: viewContext)
                    level.id = levelData.id
                    level.completed = false

                    for taskData in levelData.tasks {
                        let task = Task(context: viewContext)
                        task.task = taskData.task
                        task.image = taskData.image

                        for answerOptionData in taskData.answerOptions {
                            let answer = Answer(context: viewContext)
                            answer.name = answerOptionData.name
                            answer.rightAnswer = answerOptionData.rightAnswer

                            task.addToAnswers(answer)
                        }
                        level.addToTasks(task)
                    }
                    theme.addToLevels(level)
                }
                block.addToThemes(theme)
            }
            coreDataManager.saveContext()
        }
        for soundTestData in jsonData.soundTests {
            let soundTest = SoundTest(context: viewContext)
            soundTest.name = soundTestData.name

            for soundTaskData in soundTestData.soundTasks {
                let soundTask = SoundTask(context: viewContext)
                soundTask.id = soundTaskData.id
                soundTask.soundName = soundTaskData.soundName

                for answerOptionData in soundTaskData.answerOptions {
                    let answer = Answer(context: viewContext)
                    answer.name = answerOptionData.name
                    answer.rightAnswer = answerOptionData.rightAnswer
                    soundTask.addToAnswers(answer)
                }
                soundTest.addToSoundTasks(soundTask)
            }
            coreDataManager.saveContext()
        }

    }
}
