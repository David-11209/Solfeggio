//
//  User.swift
//  Solfeggio
//
//  Created by Давид Васильев on 26.05.2024.
//

import UIKit

struct UserModel: Decodable, Encodable {
    let name: String
    let login: String
    let password: String
    let image: String
    let notesStat: String
    let intervalsStat: String
    let moodsStat: String
    let chordsStat: String
    let numberNotesListened: String
    let numberIntervalsListened: String
    let numberMoodsListened: String
    let numberChordsListened: String
    let numberNotesSuccessListened: String
    let numberIntervalsSuccessListened: String
    let numberMoodsSuccessListened: String
    let numberChordsSuccessListened: String
    let completedLevels: [CompletedLevel]
}

struct CompletedLevel: Decodable, Encodable {
    let id: String
}
