//
//  TopicLevelsScreenViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 01.04.2024.
//

import UIKit

protocol TopicLevelsScreenViewModelProtocol: UICollectionViewDataSource {
    func setData(levels: Set<Level>)
    func getLevel(index: Int) -> Level 
}

class TopicLevelsScreenViewModel: NSObject, TopicLevelsScreenViewModelProtocol {

    private var levels: [Level] = []

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return levels.count + 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: LevelsCollectionViewCell.reuseIdentifier, for: indexPath) as? LevelsCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        if indexPath.row == 0 {
            cell.configure(color: cellDataArray[indexPath.row], image: .book, title: "Теория")
        } else {
            cell.configure(color: cellDataArray[indexPath.row], mainTitle: String(indexPath.row))
        }
        return cell
    }

    func setData(levels: Set<Level>) {
        self.levels = Array(levels)
        print(levels.count)
    }

    func getLevel(index: Int) -> Level {
        return levels[index]
    }
}

private struct LevelCellColors {
    var colors: [UIColor]
}

private var cellDataArray: [UIColor] = [
    .pDarkBlue,
    .pPink,
    .pOrange,
    .pPurple,
    .pYellow,
    .pDarkBlue,
    .pPink,
    .pOrange,
    .pPurple,
    .pYellow,
    .pDarkBlue,
    .pPink,
    .pOrange,
    .pPurple,
    .pYellow
]
