//
//  MainScreenViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 08.04.2024.
//

import UIKit

class MainScreenViewController: UIViewController {

    private let contentView: MainScreenView = .init()
    private let viewModel: MainScreenViewModelProtocol

    var closeClosure: (((Theme, Float)) -> Void)?
    init(viewModel: MainScreenViewModelProtocol) {
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
        contentView.topicsCollectionView.delegate = self
        contentView.topicsCollectionView.dataSource = viewModel
        viewModel.closeClosure = { tuple in
            self.closeClosure?(tuple)
        }
        viewModel.reloadClosure = {
            DispatchQueue.main.async {
                for index in 0..<self.contentView.topicsCollectionView.numberOfItems(inSection: 0) {
                    guard let cell = self.contentView.topicsCollectionView.cellForItem(
                        at: IndexPath(
                            row: index,
                            section: 0
                        )
                    ) as? MainScreenCollectionViewCell else {
                        return
                    }
                    cell.collectionView.reloadData()
                }
            }
        }
        viewModel.successfulDataAcquisition = { [weak self] in
            DispatchQueue.main.async {
                self?.contentView.topicsCollectionView.reloadData()
            }
        }
        contentView.topicsCollectionView.register(
            MainScreenCollectionViewCell.self, forCellWithReuseIdentifier: MainScreenCollectionViewCell.reuseIdentifier)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.reloadDataSource()

    }
}

extension MainScreenViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        if indexPath.row == 1 {
            return CGSize(width: UIScreen.main.bounds.width, height: 200)
        } else {
            return CGSize(width: UIScreen.main.bounds.width, height: 280)
        }
    }
}
