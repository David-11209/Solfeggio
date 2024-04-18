//
//  TopicLevelsScreenViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 01.04.2024.
//

import UIKit

protocol TopicLevelsScreenViewModelProtocol: UICollectionViewDataSource {

}

class TopicLevelsScreenViewModel: NSObject, TopicLevelsScreenViewModelProtocol {

    private var levelNames: [String] = []

    init(levelNames: [String]) {
        self.levelNames = levelNames
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return levelNames.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: LevelsCollectionViewCell.reuseIdentifier, for: indexPath) as? LevelsCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        if indexPath.row == 0 {
            cell.configure(colors: cellDataArray[indexPath.row].colors, image: .book, title: "Теория")
        } else {
            cell.configure(colors: cellDataArray[indexPath.row].colors, mainTitle: String(indexPath.row), title: "Уровень")
        }
        return cell
    }
}

private struct LevelCellColors {
    var colors: [UIColor]
}

private var cellDataArray: [LevelCellColors] = [
    LevelCellColors(colors: [.red, .yellow]),
    LevelCellColors(colors: [.mySPink, .myCyan]),
    LevelCellColors(colors: [.yellow, .green]),
    LevelCellColors(colors: [.mySBlueLight, .myLightYellow]),
    LevelCellColors(colors: [.mySPink, .mySPeach]),
    LevelCellColors(colors: [.myBlue, .green]),
    LevelCellColors(colors: [.red, .yellow]),
    LevelCellColors(colors: [.mySPink, .myCyan]),
    LevelCellColors(colors: [.yellow, .green]),
    LevelCellColors(colors: [.mySBlueLight, .myLightYellow]),
    LevelCellColors(colors: [.mySPink, .mySPeach]),
    LevelCellColors(colors: [.myBlue, .green])
]
