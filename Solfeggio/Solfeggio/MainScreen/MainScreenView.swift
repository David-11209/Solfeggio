//
//  MainScreenView.swift
//  Solfeggio
//
//  Created by Давид Васильев on 08.04.2024.
//

import UIKit

class MainScreenView: UIView {

    private lazy var titleLabel: UILabel = UILabel()

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
        self.backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        setUpTitleLabel()
        setUpTopicsCollectionView()
    }

    private func setUpTitleLabel() {
        addSubview(titleLabel)
        titleLabel.text = "Уроки"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 36.0)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(80)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
        }
    }

    private func setUpTopicsCollectionView() {
        addSubview(topicsCollectionView)
        topicsCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(titleLabel.snp_bottomMargin).offset(20)
            make.bottom.equalToSuperview()
        }
    }
}
