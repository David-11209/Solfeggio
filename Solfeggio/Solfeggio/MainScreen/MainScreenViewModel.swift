//
//  MainScreenViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 08.04.2024.
//

import UIKit

protocol MainScreenViewModelProtocol: UICollectionViewDataSource {
    var closeClosure: ((_ theme: Theme) -> Void)? { get set }
    var successfulDataAcquisition: (() -> Void)? { get set }
}

class MainScreenViewModel: NSObject, MainScreenViewModelProtocol {

    var closeClosure: ((_ theme: Theme) -> Void)?
    var successfulDataAcquisition: (() -> Void)?
    var coreDataManager: CoreDataManagerProtocol
    var networkService: NetworkServiceProtocol
    var convertService: ConvertServiceProtocol
    var dataSource: [Block] = []

    init(
        coreDataManager: CoreDataManagerProtocol,
        networkService: NetworkServiceProtocol,
        convertService: ConvertServiceProtocol
    ) {
        self.coreDataManager = coreDataManager
        self.networkService = networkService
        self.convertService = convertService
        super.init()
        requestData { data in
            self.dataSource = data
            self.successfulDataAcquisition?()
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MainScreenCollectionViewCell.reuseIdentifier, for: indexPath) as? MainScreenCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        if indexPath.row == 0 {
            cell.configureFirstCell()
            return cell
        } else if indexPath.row == 1 {
            cell.configureSecondCell()
        } else {
            cell.configure(block: dataSource[indexPath.row - 2])
            cell.didSelectItem = { [weak self] theme in
                self?.closeClosure?(theme)
            }
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count + 2
    }

    private func requestData(completion: @escaping ([Block]) -> Void) {
        let backgroundQueue = DispatchQueue.global(qos: .background)
        backgroundQueue.async {
            var coreData = self.coreDataManager.obtainAllData()
            if coreData.isEmpty {
                self.networkService.getData(completion: { result in
                    switch result {
                    case .success(let data):
                        self.convertService.convertDataToCoreData(jsonData: data)
                        coreData = self.coreDataManager.obtainAllData()
                        completion(coreData)
                        break
                    case .failure(let error):
                        print("Error retrieving data: \(error.localizedDescription)")
                        break
                    }
                })
            }
            completion(coreData)
        }
    }
}
