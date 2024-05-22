//
//  HearingTestScreenViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 14.04.2024.
//

import UIKit

protocol HearingTestScreenViewModelProtocol {
    func dataPrint()
    func getDataSelectedTopic(selectedTopic: String) -> [SoundTask]
}

class HearingTestScreenViewModel: NSObject, HearingTestScreenViewModelProtocol {

    var closeClosure: ((_ theme: Theme) -> Void)?
//    var successfulDataAcquisition: (() -> Void)?
    var coreDataManager: CoreDataManagerProtocol
    var dataSource: [SoundTest] = []

    init(
        coreDataManager: CoreDataManagerProtocol
    ) {
        self.coreDataManager = coreDataManager
        super.init()
        requestData { data in
            self.dataSource = data
//            self.successfulDataAcquisition?()
        }
    }

    func dataPrint() {
        for test in dataSource {
            print(test.name)
            for task in test.soundTasks {
                print(task.soundName)
            }
        }
    }

    private func requestData(completion: @escaping ([SoundTest]) -> Void) {
        let backgroundQueue = DispatchQueue.global(qos: .background)
        backgroundQueue.async {
            let coreData = self.coreDataManager.obtainSoundTestsData()
            completion(coreData)
        }
    }

    func getDataSelectedTopic(selectedTopic: String) -> [SoundTask] {
        var resultArray: [SoundTask] = []
        for test in dataSource {
            if selectedTopic == test.name {
                for task in test.soundTasks {
                    resultArray.append(task)
                }
            }
        }
        return resultArray
    }
}
