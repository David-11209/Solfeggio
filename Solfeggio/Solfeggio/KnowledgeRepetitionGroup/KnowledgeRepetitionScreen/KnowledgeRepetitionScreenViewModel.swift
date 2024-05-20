//
//  KnowledgeRepetitionScreenViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 15.04.2024.
//

import UIKit
import CoreData
protocol KnowledgeRepetitionSViewModelProtocol {
    func getNames() -> [String]
    func setChooseNames(names: [String])
    func getTasks() -> [Task]
    func setSelectedNumberTasks(number: Int)
}

class KnowledgeRepetitionScreenViewModel: NSObject, KnowledgeRepetitionSViewModelProtocol {

    var coreDataManager: CoreDataManagerProtocol
    var dataSource: [Block] = []
    var namesBlocks: [String] = []
    var chooseNames: Set<String> = .init()
    var selectedNumberTasks = 10
    var userDefaultsBlocks: [String: Bool] = UserDefaults.standard.object(forKey: "chooseBlocks") as? [String: Bool] ?? [:]

    init(
        coreDataManager: CoreDataManagerProtocol
    ) {
        self.coreDataManager = coreDataManager
        super.init()
        requestData { data in
            self.dataSource = data
            for block in self.dataSource {
                self.namesBlocks.append(block.name)
            }
        }
        var resultArray: [String] = []
        for block in userDefaultsBlocks where block.value {
            resultArray.append(block.key)
        }
        setChooseNames(names: resultArray)
    }

    private func requestData(completion: @escaping ([Block]) -> Void) {
        let backgroundQueue = DispatchQueue.global(qos: .background)
        backgroundQueue.async {
            let coreData = self.coreDataManager.obtainAllData()
            completion(coreData)
        }
    }

    func setSelectedNumberTasks(number: Int) {
        switch number {
        case 0:
            selectedNumberTasks = 10
        case 1:
            selectedNumberTasks = 20
        case 2:
            selectedNumberTasks = 30
        default:
            break
        }
    }

    func getNames() -> [String] {
        return namesBlocks
    }

    func setChooseNames(names: [String]) {
        chooseNames = Set(names)
    }

    func getTasks() -> [Task] {
        var tasks: [Task] = []
        for block in dataSource where chooseNames.contains(block.name) {
            for theme in block.themes {
                for level in  theme.levels {
                    for task in level.tasks {
                        tasks.append(task)
                    }
                }
            }
        }
        tasks.shuffle()
        return Array(tasks.prefix(selectedNumberTasks))
    }
}
