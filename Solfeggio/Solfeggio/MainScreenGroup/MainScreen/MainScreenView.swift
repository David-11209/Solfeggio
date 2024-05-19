//
//  MainScreenView.swift
//  Solfeggio
//
//  Created by Давид Васильев on 08.04.2024.
//

import UIKit

class MainScreenView: UIView {

    lazy var topicsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        self.backgroundColor = .pBlue
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        setUpTopicsCollectionView()
    }

    private func setUpTopicsCollectionView() {
        addSubview(topicsCollectionView)
        topicsCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(-300)
            make.bottom.equalToSuperview()
        }
    }
}
