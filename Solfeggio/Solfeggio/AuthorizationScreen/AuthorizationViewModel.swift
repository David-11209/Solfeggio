//
//  AuthorizationViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 26.05.2024.
//

import UIKit
protocol AuthorizationViewModelProtocol {
    func addAuthorizationInfo(login: String, password: String)
    func getUser() -> UserModel
    var resultClosure: ((Bool) -> Void)? { get set}
}

class AuthorizationViewModel: AuthorizationViewModelProtocol {
    private var user = UserModel(
        name: "",
        login: "",
        password: "",
        image: "",
        notesStat: "",
        intervalsStat: "",
        moodsStat: "",
        chordsStat: "",
        numberNotesListened: "",
        numberIntervalsListened: "",
        numberMoodsListened: "",
        numberChordsListened: "",
        numberNotesSuccessListened: "",
        numberIntervalsSuccessListened: "",
        numberMoodsSuccessListened: "",
        numberChordsSuccessListened: "",
        completedLevels: []
    )
    var networkService: NetworkServiceProtocol
    var resultClosure: ((Bool) -> Void)?
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func addAuthorizationInfo(login: String, password: String) {
        self.user = UserModel(
            name: "",
            login: login,
            password: password,
            image: "",
            notesStat: "",
            intervalsStat: "",
            moodsStat: "",
            chordsStat: "",
            numberNotesListened: "",
            numberIntervalsListened: "",
            numberMoodsListened: "",
            numberChordsListened: "",
            numberNotesSuccessListened: "",
            numberIntervalsSuccessListened: "",
            numberMoodsSuccessListened: "",
            numberChordsSuccessListened: "",
            completedLevels: []
        )
        getUser(login: login, password: password)
    }

    func getUser(login: String, password: String) {
        networkService.executeGetUser(login: login, password: password, completion: { user in
            if let user = user {
                self.user = user
                self.resultClosure?(true)
            } else {
                self.resultClosure?(false)
            }
        })
    }

    func getUser() -> UserModel {
        return user
    }
}
