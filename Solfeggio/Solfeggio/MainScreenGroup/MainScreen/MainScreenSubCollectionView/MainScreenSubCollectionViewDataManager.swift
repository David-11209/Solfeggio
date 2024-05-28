//
//  MainScreenSubCollectionViewDataManager.swift
//  Solfeggio
//
//  Created by Давид Васильев on 08.04.2024.
//

import UIKit

protocol MainScreenSubCVDataManagerProtocol: UICollectionViewDataSource {
    func setData(data: Set<Theme>)
    func getData(index: Int) -> (Theme, Float)
}

class MainScreenSubCollectionViewDataManager: NSObject, MainScreenSubCVDataManagerProtocol {

    private var data: [Theme] = []

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MainScreenSubCollectionViewCell.reuseIdentifier, for: indexPath) as? MainScreenSubCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.configure(color: cellDataArray.randomElement() ?? .white, theme: data[indexPath.row], progressProcent: getProgress(index: indexPath.row))
        return cell
    }

    func setData(data: Set<Theme>) {
        self.data = Array(data)
    }

    func getData(index: Int) -> (Theme, Float) {
        return (data[index], getProgress(index: index))
    }

    func getProgress(index: Int) -> Float {
        var count = data[index].levels.count
        if count == 0 {
            return 0.0
        } else {
            var completeLevelsCount: Float = 0.0
            for level in data[index].levels {
                if level.completed {
                    completeLevelsCount += 1
                }
            }
            return completeLevelsCount / Float(count) * 100
        }
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

private var cellDataArray: [UIColor] = [
    .pDarkBlue,
    .pPink,
    .pOrange,
    .pPurple
]

