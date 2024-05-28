//
//  ProfileScreenViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 15.04.2024.
//

import UIKit

protocol ProfileScreenViewModelProtocol {
    func setUser(user: UserModel, newUser: Bool)
    func getUser() -> User?
    func getUserLevelsStat() -> Float 
}

class ProfileScreenViewModel: ProfileScreenViewModelProtocol {

    private var user: UserModel?
    private var coreDataManager: CoreDataManagerProtocol

    init(coreDataManager: CoreDataManagerProtocol) {
        self.coreDataManager = coreDataManager
    }

    func setUser(user: UserModel, newUser: Bool) {
        self.user = user
        if newUser {
            saveUserInCoreData()
            setCompletedLevels()
        }
    }

    func getUser() -> User? {
        return coreDataManager.obtainUser().first
    }

    func saveUserInCoreData() {
        let newUser = User(context: coreDataManager.getViewContext())
        guard let user else { return }
        newUser.name = user.name
        newUser.login = user.login
        newUser.password = user.password
        newUser.image = Int16(user.image) ?? 1
        newUser.notesStat = Float(user.notesStat) ?? 0.0
        newUser.intervalsStat = Float(user.intervalsStat) ?? 0.0
        newUser.moodsStat = Float(user.moodsStat) ?? 0.0
        newUser.chordsStat = Float(user.chordsStat) ?? 0.0

        newUser.numberNotesListened = Int16(user.numberNotesListened) ?? 0
        newUser.numberIntervalsListened = Int16(user.numberIntervalsListened) ?? 0
        newUser.numberMoodsListened = Int16(user.numberMoodsListened) ?? 0
        newUser.numberChordsListened = Int16(user.numberChordsListened) ?? 0

        newUser.numberNotesListened = Int16(user.numberNotesListened) ?? 0
        newUser.numberIntervalsListened = Int16(user.numberIntervalsListened) ?? 0
        newUser.numberMoodsListened = Int16(user.numberMoodsListened) ?? 0
        newUser.numberChordsListened = Int16(user.numberChordsListened) ?? 0
        coreDataManager.saveContext()
    }

    func setCompletedLevels() {
        var levelsCoreData = coreDataManager.obtainLevels()
        if let user = user {
            for level in user.completedLevels {
                for levelCoreData in levelsCoreData {
                    if level.id == levelCoreData.id {
                        levelCoreData.completed = true
                    }
                }
            }
        }
        coreDataManager.saveContext()
    }

    func getUserLevelsStat() -> Float {
        let levels = coreDataManager.obtainLevels()
        var completedLevelsCount = 0
        for level in levels {
            if level.completed {
                completedLevelsCount += 1
            }
        }
        return Float(completedLevelsCount) / Float(levels.count)
    }
}
