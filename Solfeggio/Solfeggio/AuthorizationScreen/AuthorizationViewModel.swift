//
//  AuthorizationViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 26.05.2024.
//

import UIKit
protocol AuthorizationViewModelProtocol {
    func addAuthorizationInfo(login: String, password: String)
    func getAuthorizationInfo() -> User
}

class AuthorizationViewModel: AuthorizationViewModelProtocol {
    private var user = User(name: "", login: "", password: "", image: 0)
    var networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func addAuthorizationInfo(login: String, password: String) {
        self.user = User(name: "", login: login, password: password, image: 0)
    }

    func getUser() {
        networkService
    }


    func getAuthorizationInfo() -> User {
        return user
    }
}
