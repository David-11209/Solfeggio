//
//  HearingTestScreenViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 14.04.2024.
//

import UIKit

protocol HearingTestScreenViewModelProtocol {
    func getDataSelectedTopic(selectedTopic: String) -> [SoundTask]
}

class HearingTestScreenViewModel: NSObject, HearingTestScreenViewModelProtocol {

    var closeClosure: ((_ theme: Theme) -> Void)?
    var coreDataManager: CoreDataManagerProtocol
    var dataSource: [SoundTest] = []

    init(
        coreDataManager: CoreDataManagerProtocol
    ) {
        self.coreDataManager = coreDataManager
        super.init()

    }

    private func requestData(completion: @escaping ([SoundTest]) -> Void) {
        let coreData = self.coreDataManager.obtainSoundTestsData()
        completion(coreData)
    }

    func getDataSelectedTopic(selectedTopic: String) -> [SoundTask] {
        requestData { data in
            self.dataSource = data
        }
        var resultArray: [SoundTask] = []
        for test in dataSource where selectedTopic == test.name {
            resultArray.append(contentsOf: test.soundTasks)
        }
        return resultArray
    }
}
