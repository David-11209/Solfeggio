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
    var userDefaultsBlocks: [String: Bool] = UserDefaults.standard.object(forKey: "chooseBlocks") as? [String: Bool] ?? [:]

    func setData(names: [String]) {
        blockNames = names
        if userDefaultsBlocks.isEmpty {
            for name in blockNames {
                blocksDict[name] = false
            }
        } else {
            blocksDict = userDefaultsBlocks
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
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
        let enabled = userDefaultsBlocks[blockNames[indexPath.row]] ?? false
        cell.configure(color: cellDataArray[indexPath.row], title: blockNames[indexPath.row], enabled: enabled)

        return cell
    }

    func getChooseBlocks() -> [String] {
        var resultArray: [String] = []
        for block in blocksDict where block.value {
            resultArray.append(block.key)
        }
        UserDefaults.standard.set(blocksDict, forKey: "chooseBlocks")
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
