//
//  ProfileScreenViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 15.04.2024.
//

import UIKit

protocol ProfileScreenViewModelProtocol {
    func setUser(user: User)
    func getUser() -> User?
}

class ProfileScreenViewModel: ProfileScreenViewModelProtocol {

    private var user: User?

    func setUser(user: User) {
        self.user = user
    }

    func getUser() -> User? {
        return user ?? nil
    }
}
