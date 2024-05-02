//
//  MainScreenSubCollectionViewDataManager.swift
//  Solfeggio
//
//  Created by Давид Васильев on 08.04.2024.
//

import UIKit

protocol MainScreenSubCVDataManagerProtocol: UICollectionViewDataSource {

}

class MainScreenSubCollectionViewDataManager: NSObject, MainScreenSubCVDataManagerProtocol {

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
        if indexPath.row == 0 {
            cell.configure(color: cellDataArray.randomElement() ?? .white, title: "", progressProcent: "")
        }
        /// Это будет заменено,  после того как напишу модели
        cell.configure(color: cellDataArray.randomElement() ?? .white, title: "Нотная грамота", progressProcent: "57%")
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

private var cellDataArray: [UIColor] = [
    .pDarkBlue,
    .pPink,
    .pOrange,
    .pPurple
]

