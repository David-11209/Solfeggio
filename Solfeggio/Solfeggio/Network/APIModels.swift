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

struct SoundTaskModel: Decodable {
    let id: String
    let soundName: String
    let answerOptions: [AnswerOptionModel]
}

struct LevelModel: Decodable {
    let id: String
    let tasks: [TaskModel]
}

struct ThemeModel: Decodable {
    let id: String
    let name: String
    let theoryText: String
    let theoryImage: String
    let levels: [LevelModel]
}

struct BlockModel: Decodable {
    let name: String
    let themes: [ThemeModel]
}

struct SoundTestModel: Decodable {
    let name: String
    let soundTasks: [SoundTaskModel]
}

struct JSONData: Decodable {
    let blocks: [BlockModel]
    let soundTests: [SoundTestModel]
}
