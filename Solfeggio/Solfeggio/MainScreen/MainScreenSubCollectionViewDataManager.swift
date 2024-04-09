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
        cell.configure(colors: [.myBlue, .myCyan])
        return cell
    }
}
