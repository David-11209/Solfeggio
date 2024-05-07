//
//  SolfeggioAPIModels.swift
//  Solfeggio
//
//  Created by Давид Васильев on 04.05.2024.
//

import Foundation

struct AnswerOptionModel: Decodable {
    let id: String
    let name: String
    let rightAnswer: Bool
}

struct TaskModel: Decodable {
    let task: String
    let image: String
    let answerOptions: [AnswerOptionModel]
}

struct LevelModel: Decodable {
    let id: String
    let tasks: [TaskModel]
}

struct ThemeModel: Decodable {
    let id: String
    let name: String
    let levels: [LevelModel]
}

struct BlockModel: Decodable {
    let name: String
    let themes: [ThemeModel]
}

struct JSONData: Decodable {
    let blocks: [BlockModel]
}
