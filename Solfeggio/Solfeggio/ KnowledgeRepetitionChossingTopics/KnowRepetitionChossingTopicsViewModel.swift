//
//  KnowledgeRepetitionChossingTopicsViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 26.04.2024.
//

import UIKit

protocol KnowRepChossingTopicsViewModelProtocol: UICollectionViewDataSource {
}

class KnowRepetitionChossingTopicsViewModel: NSObject, KnowRepChossingTopicsViewModelProtocol {

    private var levelNames: [String] = []

    init(levelNames: [String]) {
        self.levelNames = levelNames
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(levelNames.count)
        return levelNames.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: KnowRepChossingTopicsCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? KnowRepChossingTopicsCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.configure(color: cellDataArray[indexPath.row], title: levelNames[indexPath.row])
        return cell
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
    .pYellow
]
