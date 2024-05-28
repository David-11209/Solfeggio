//
//  TopicLevelScreenViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 01.04.2024.
//

import UIKit

class TopicLevelsScreenViewController: UIViewController {

    private var contentView: TopicLevelsScreenView
    private let viewModel: TopicLevelsScreenViewModelProtocol

    var didSelectItem: ((_ level: Level) -> Void)?
    var didSelectTheory: (() -> Void)?
    var exitClosure: (() -> Void)?

    init(viewModel: TopicLevelsScreenViewModelProtocol) {
        self.viewModel = viewModel
        self.contentView = TopicLevelsScreenView(frame: CGRect())
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
        contentView.configure(progress: viewModel.getProgress())
        contentView.levelsCollectionView.register(
            LevelsCollectionViewCell.self, forCellWithReuseIdentifier: LevelsCollectionViewCell.reuseIdentifier)
        contentView.exitClosure = {
            self.exitClosure?()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contentView.configure(progress: viewModel.getProgress())
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

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            didSelectTheory?()
        } else {
            didSelectItem?(viewModel.getLevel(index: indexPath.row - 1))
        }

    }
}
