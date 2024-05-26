//
//  RegistrationViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 26.05.2024.
//

import UIKit

protocol RegistrationViewModelProtocol {
    func addRegistrationInfo(name: String, login: String, password: String, image: Int)
    func getRegistrationInfo() -> User
    var resultClosure: ((Bool) -> Void)? { get set}
}

class RegistrationViewModel: RegistrationViewModelProtocol {
    private var user = User(name: "", login: "", password: "", image: 0)
    var networkService: NetworkServiceProtocol
    var resultClosure: ((Bool) -> Void)?

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func addRegistrationInfo(name: String, login: String, password: String, image: Int) {
        self.user = User(name: name, login: login, password: password, image: image)
        createNewUser()
    }

    private func createNewUser() {
        networkService.executeAddNewUser(name: user.name, login: user.login, password: user.password, image: user.image)
        networkService.resultClosure = { result in
            self.resultClosure?(result)
        }
    }

    func getRegistrationInfo() -> User {
        return user
    }
}
