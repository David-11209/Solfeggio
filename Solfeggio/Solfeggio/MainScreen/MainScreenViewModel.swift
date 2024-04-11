//
//  MainScreenViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 08.04.2024.
//

import UIKit

class MainScreenViewModel: NSObject, UICollectionViewDataSource {

    private var topics: [String]

    init(topics: [String]) {
        self.topics = topics
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MainScreenCollectionViewCell.reuseIdentifier, for: indexPath) as? MainScreenCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.configure(title: topics[indexPath.row], image: .interval)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topics.count
    }
}
