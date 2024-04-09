//
//  MainScreenViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 08.04.2024.
//

import UIKit

class MainScreenViewModel: NSObject, UICollectionViewDataSource {
    var topics = ["Тема1","Тема2","Тема3","Тема4","Тема5","Тема6","Тема1","Тема2","Тема3","Тема4","Тема5","Тема6"]

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MainScreenCollectionViewCell.reuseIdentifier, for: indexPath) as? MainScreenCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.configure(colors: [.myBlue, .myCyan])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topics.count
    }
}
