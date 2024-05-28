//
//  MainScreenCollectionViewCell.swift
//  Solfeggio
//
//  Created by Давид Васильев on 08.04.2024.
//
import SnapKit
import UIKit

class MainScreenCollectionViewCell: UICollectionViewCell {

    private var dataManager: MainScreenSubCollectionViewDataManager = MainScreenSubCollectionViewDataManager()
    private lazy var imageView: UIImageView = UIImageView()
    private lazy var titleLabel: UILabel = UILabel()
    private lazy var mainImageView: UIImageView = UIImageView()
    private lazy var mainTitle: UILabel = UILabel()
    var didSelectItem: (((Theme, Float)) -> Void)?
    var collectionView: UICollectionView = {
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

    func configure(block: Block) {
        titleLabel.text = block.name
        imageView.image = .interval
        dataManager.setData(data: block.themes)
    }

    func configureFirstCell() {
        collectionView.isHidden = true
        titleLabel.isHidden = true
        imageView.isHidden = true
    }

    func configureSecondCell() {
        collectionView.isHidden = true
        titleLabel.isHidden = true
        imageView.isHidden = true
        setUpMainTitle()
        setUpMainImage()
    }

    private func setUp() {
        setUpImage()
        setUpTitleLabel()
        setUpTopicsCollectionView()
    }

    private func setUpMainTitle() {
        addSubview(mainTitle)
        mainTitle.text = "Уроки"
        mainTitle.font = UIFont.boldSystemFont(ofSize: 36.0)
        mainTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(38)
        }
    }

    private func setUpMainImage() {
        addSubview(mainImageView)
        mainImageView.image = .sax
        mainImageView.contentMode = .scaleAspectFit
        mainImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }

    private func setUpImage() {
        addSubview(imageView)
        imageView.image = .interval
        imageView.scalesLargeContentImage = true
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
        collectionView.backgroundColor = .clear
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

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectItem?(dataManager.getData(index: indexPath.row))
    }
}
