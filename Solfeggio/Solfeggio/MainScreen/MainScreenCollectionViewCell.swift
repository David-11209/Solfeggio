//
//  MainScreenCollectionViewCell.swift
//  Solfeggio
//
//  Created by Давид Васильев on 08.04.2024.
//
import SnapKit
import UIKit

class MainScreenCollectionViewCell: UICollectionViewCell {

    /// Инициализация dataManager будет изменена после создания моделей
    private var dataManager = MainScreenSubCollectionViewDataManager(data: ["123", "123"])
    private lazy var imageView: UIImageView = UIImageView()
    private lazy var titleLabel: UILabel = UILabel()
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(title: String, image: UIImage) {
        titleLabel.text = title
        imageView.image = image

    }

    private func setUp() {
        setUpImage()
        setUpTitleLabel()
        setUpTopicsCollectionView()
    }

    private func setUpImage() {
        addSubview(imageView)
        imageView.image = .musicalnotation
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.height.width.equalTo(38)
            make.top.equalToSuperview()
        }
    }

    private func setUpTitleLabel() {
        addSubview(titleLabel)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 26.0)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(80)
            make.trailing.equalToSuperview()
            make.height.equalTo(38)
            make.top.equalToSuperview()
        }
    }

    private func setUpTopicsCollectionView() {
        addSubview(collectionView)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = dataManager
        collectionView.register(MainScreenSubCollectionViewCell.self, forCellWithReuseIdentifier: MainScreenSubCollectionViewCell.reuseIdentifier)
        collectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(50)
            make.bottom.equalToSuperview()
        }
    }
}

extension MainScreenCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 200)
    }
}
