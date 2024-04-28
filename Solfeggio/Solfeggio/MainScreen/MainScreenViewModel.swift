//
//  MainScreenViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 08.04.2024.
//

import UIKit

protocol MainScreenViewModelProtocol: UICollectionViewDataSource {

}

class MainScreenViewModel: NSObject, MainScreenViewModelProtocol {

    var closeClosure: (() -> Void)?

    private var topics: [String] = ["", "", "Нотная грамота", "Тональности и лады", "Интервалы"]

    override init() {
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
            cell.configure(title: topics[indexPath.row], image: .interval)
            cell.didSelectItem = { [weak self] indexPath in
                /// indexPath будет использован в следущем MR
                self?.closeClosure?()
            }
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topics.count
    }
}
