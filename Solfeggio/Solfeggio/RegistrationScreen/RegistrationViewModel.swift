//
//  RegistrationViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 26.05.2024.
//

import UIKit

protocol RegistrationViewModelProtocol {
    func addRegistrationInfo(name: String, login: String, password: String, image: Int)
    func getUser() -> User
    var resultClosure: ((Bool) -> Void)? { get set}
}

class RegistrationViewModel: RegistrationViewModelProtocol {
    private var user = User(name: "", login: "", password: "", image: "", completedLevels: [])
    var networkService: NetworkServiceProtocol
    var resultClosure: ((Bool) -> Void)?

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func addRegistrationInfo(name: String, login: String, password: String, image: Int) {
        self.user = User(name: name, login: login, password: password, image: String(image), completedLevels: [])
        createNewUser()
    }

    private func createNewUser() {
        networkService.executeAddNewUser(name: user.name, login: user.login, password: user.password, image: String(user.image))
        networkService.resultClosure = { result in
            self.resultClosure?(result)
        }
    }

    func getUser() -> User {
        return user
    }
}
