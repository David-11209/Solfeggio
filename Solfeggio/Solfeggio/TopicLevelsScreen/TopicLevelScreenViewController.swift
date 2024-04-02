//
//  TopicLevelScreenViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 01.04.2024.
//

import UIKit

class TopicLevelsScreenViewController: UIViewController {

    private let contentView: TopicLevelsScreenView = .init()
    private let viewModel: TopicLevelsScreenViewModel

    init(viewModel: TopicLevelsScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        view = contentView
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.levelsCollectionView.delegate = self
        contentView.levelsCollectionView.dataSource = viewModel
        contentView.levelsCollectionView.register(
            LevelsCollectionViewCell.self, forCellWithReuseIdentifier: LevelsCollectionViewCell.reuseIdentifier)
    }
}

extension TopicLevelsScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = collectionView.frame.width / 2 - 6
            let height = 190.0
            return CGSize(width: width, height: height)
    }
}
