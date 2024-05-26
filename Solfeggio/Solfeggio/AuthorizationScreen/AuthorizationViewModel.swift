//
//  AuthorizationViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 26.05.2024.
//

import UIKit
protocol AuthorizationViewModelProtocol {
    func addAuthorizationInfo(login: String, password: String)
    func getUser() -> User
    var resultClosure: ((Bool) -> Void)? { get set}
}

class AuthorizationViewModel: AuthorizationViewModelProtocol {
    private var user = User(name: "", login: "", password: "", image: "", completedLevels: [])
    var networkService: NetworkServiceProtocol
    var resultClosure: ((Bool) -> Void)?
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func addAuthorizationInfo(login: String, password: String) {
        self.user = User(name: "", login: login, password: password, image: "", completedLevels: [])
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

    func getUser() -> User {
        return user
    }
}
