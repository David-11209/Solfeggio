//
//  KnowledgeRepetitionChossingTopicsViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 26.04.2024.
//

import UIKit
import Combine
protocol KnowRepChossingTopicsViewModelProtocol: UICollectionViewDataSource {
    func setData(names: [String])
    func getChooseBlocks() -> [String]
}

class KnowRepetitionChossingTopicsViewModel: NSObject, KnowRepChossingTopicsViewModelProtocol {

    private var blockNames: [String] = []
    var blocksDict: [String: Bool] = [:]
    func setData(names: [String]) {
        blockNames = names
        for name in blockNames {
            blocksDict[name] = false
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(blockNames.count)
        return blockNames.count
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
        cell.switchClosure = {
            self.blocksDict[self.blockNames[indexPath.row]]?.toggle()
        }

        cell.configure(color: cellDataArray[indexPath.row], title: blockNames[indexPath.row])

        return cell
    }

    func getChooseBlocks() -> [String] {
        var resultArray: [String] = []
        for block in blocksDict {
            if block.value {
                resultArray.append(block.key)
            }
        }
        return resultArray
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
