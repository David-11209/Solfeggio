//
//  TopicLevelsScreenViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 01.04.2024.
//

import UIKit

protocol TopicLevelsScreenViewModelProtocol: UICollectionViewDataSource {
    func setData(levels: Set<Level>, theme: Theme, progress: Float)
    func getLevel(index: Int) -> Level
    func getProgress() -> Float
}

class TopicLevelsScreenViewModel: NSObject, TopicLevelsScreenViewModelProtocol {

    private var levels: [Level] = []
    private var theme: Theme?
    private var progress: Float = 0.0

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

    func setData(levels: Set<Level>, theme: Theme, progress: Float) {
        self.levels = Array(levels)
        self.progress = progress
        self.theme = theme
    }

    func getLevel(index: Int) -> Level {
        return levels[index]
    }

    func getProgress() -> Float {
        var result = 0
        for level in levels {
            if level.completed {
                result += 1
            }
        }
        return Float(result) / Float(levels.count)
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
