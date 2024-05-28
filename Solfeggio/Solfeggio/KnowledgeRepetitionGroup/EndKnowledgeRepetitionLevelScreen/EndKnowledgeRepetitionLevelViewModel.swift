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
    func setResult(result: Int, tasksCount: Int, categoryName: String)
}

class EndKnowledgeRepetitionLevelViewModel: EndKRLevelViewModelProtocol {
    private var result: Int = 0
    private var tasksCount: Int = 0
    private var coreDataManager: CoreDataManagerProtocol

    init(coreDataManager: CoreDataManagerProtocol) {
        self.coreDataManager = coreDataManager
    }

    func getResult() -> (Int, Int) {
        return (result, tasksCount)
    }

    func setResult(result: Int, tasksCount: Int) {
        self.result = result
        self.tasksCount = tasksCount
    }

    func setResult(result: Int, tasksCount: Int, categoryName: String) {
        self.result = result
        self.tasksCount = tasksCount
        guard let user = coreDataManager.obtainUser().first else { return }
        print(user.numberNotesListened)
        print(user.numberNotesSuccessListened)
        print(user.notesStat)
        switch categoryName {
        case "Ноты":
            user.numberNotesListened += Int16(tasksCount)
            user.numberNotesSuccessListened += Int16(result)
            user.notesStat = Float(user.numberNotesSuccessListened) / Float(user.numberNotesListened)
            print(user.numberNotesListened)
            print(user.numberNotesSuccessListened)
            print(user.notesStat)
        case "Интервалы":
            user.numberIntervalsListened += Int16(tasksCount)
            user.numberIntervalsSuccessListened += Int16(result)
            user.intervalsStat = Float(user.numberIntervalsSuccessListened) / Float(user.numberIntervalsListened)
            print(user.numberIntervalsListened)
            print(user.numberIntervalsSuccessListened)
            print(user.intervalsStat)
        case "Лады":
            user.numberMoodsListened += Int16(tasksCount)
            user.numberMoodsSuccessListened += Int16(result)
            user.moodsStat = Float(user.numberMoodsSuccessListened) / Float(user.numberMoodsListened)
            print(user.numberMoodsListened)
            print(user.numberMoodsSuccessListened)
            print(user.moodsStat)
        case "Аккорды":
            user.numberChordsListened += Int16(tasksCount)
            user.numberChordsSuccessListened += Int16(result)
            user.chordsStat = Float(user.numberChordsSuccessListened) / Float(user.numberChordsListened)
            print(user.numberChordsListened)
            print(user.numberChordsSuccessListened)
            print(user.chordsStat)
        default:
            return
        }
        coreDataManager.saveContext()
    }
}
