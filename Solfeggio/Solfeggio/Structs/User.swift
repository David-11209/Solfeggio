//
//  User.swift
//  Solfeggio
//
//  Created by Давид Васильев on 26.05.2024.
//

import UIKit

struct User: Decodable {
    let name: String
    let login: String
    let password: String
    let image: String
    let completedLevels: [CompletedLevel]
}

struct CompletedLevel: Decodable {
    let id: String
}
