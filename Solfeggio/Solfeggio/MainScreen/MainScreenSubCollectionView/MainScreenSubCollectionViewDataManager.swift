//
//  MainScreenSubCollectionViewDataManager.swift
//  Solfeggio
//
//  Created by Давид Васильев on 08.04.2024.
//

import UIKit

protocol MainScreenSubCVDataManagerProtocol: UICollectionViewDataSource {
    func setData(data: Set<Theme>)
    func getData(index: Int) -> Theme
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
        cell.configure(color: cellDataArray.randomElement() ?? .white, theme: data[indexPath.row], progressProcent: "0%")
        return cell
    }

    func setData(data: Set<Theme>) {
        self.data = Array(data)
    }

    func getData(index: Int) -> Theme {
        return data[index]
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

