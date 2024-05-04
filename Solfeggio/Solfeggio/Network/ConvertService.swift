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

    private let coreDataManager = CoreDataManager()

    func convertDataToCoreData(jsonData: JSONData) {
        for blockData in jsonData.blocks {
            let block = Block(context: coreDataManager.viewContext)
            block.name = blockData.name

            for themeData in blockData.themes {
                let theme = Theme(context: coreDataManager.viewContext)
                theme.name = themeData.name

                for levelData in themeData.levels {
                    let level = Level(context: coreDataManager.viewContext)
                    level.id = levelData.id

                    for taskData in levelData.tasks {
                        let task = Task(context: coreDataManager.viewContext)
                        task.task = taskData.task
                        task.image = taskData.image

                        for answerOptionData in taskData.answerOptions {
                            let answer = Answer(context: coreDataManager.viewContext)
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
    }
}
