//
//  MainScreenSubCollectionViewDataManager.swift
//  Solfeggio
//
//  Created by Давид Васильев on 08.04.2024.
//

import UIKit

class MainScreenSubCollectionViewDataManager: NSObject, UICollectionViewDataSource {

    private var data: [String]

    init(data: [String]) {
        self.data = data
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MainScreenSubCollectionViewCell.reuseIdentifier, for: indexPath) as? MainScreenSubCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        print(indexPath.item)
        /// Это будет заменено,  после того как напишу модели 
        cell.configure(colors: cellDataArray.randomElement()?.colors ?? [.white, .white], title: "Нотная грамота", progressProcent: "57%")
        return cell
    }
}
private enum CellColor {
    case red
    case yellow
    case mySPink
    case myCyan
    case green
    case mySBlueLight
    case myLightYellow
    case mySPeach
    case myBlue
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

