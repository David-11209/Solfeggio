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
}

class KnowledgeRepetitionScreenViewModel: NSObject, KnowledgeRepetitionSViewModelProtocol {

    var coreDataManager: CoreDataManagerProtocol
    var dataSource: [Block] = []
    var namesBlocks: [String] = []
    var chooseNames: Set<String> = .init()

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
    }

    private func requestData(completion: @escaping ([Block]) -> Void) {
        let backgroundQueue = DispatchQueue.global(qos: .background)
        backgroundQueue.async {
            let coreData = self.coreDataManager.obtainAllData()
            completion(coreData)
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
        for block in dataSource {
            if chooseNames.contains(block.name) {
                for theme in block.themes {
                    for level in  theme.levels {
                        for task in level.tasks {
                            tasks.append(task)
                        }
                    }
                }
            }
        }
        return tasks
    }
}
