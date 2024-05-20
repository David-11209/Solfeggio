//
//  KnowledgeRepetitionChossingTopicsViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 26.04.2024.
//

import UIKit

class KnowRepChossingTopicsViewController: UIViewController {

    private let contentView: KnowledgeRepetitionChossingTopicsView = .init()
    private let viewModel: KnowRepChossingTopicsViewModelProtocol

    var didSelectItem: ((_ indexPath: IndexPath) -> Void)?
    var exitClosure: (([String]) -> Void)?

    init(viewModel: KnowRepChossingTopicsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.topicsCollectionView.delegate = self
        contentView.topicsCollectionView.dataSource = viewModel
        contentView.topicsCollectionView.register(
            KnowRepChossingTopicsCollectionViewCell.self, forCellWithReuseIdentifier: KnowRepChossingTopicsCollectionViewCell.reuseIdentifier)
        contentView.exitClosure = {
            self.exitClosure?(self.viewModel.getChooseBlocks())
        }
    }
}

extension KnowRepChossingTopicsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = collectionView.frame.width - 20
            let height = 90.0
            return CGSize(width: width, height: height)
    }
}
