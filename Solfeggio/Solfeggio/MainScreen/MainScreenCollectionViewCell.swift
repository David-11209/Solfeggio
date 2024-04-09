//
//  MainScreenCollectionViewCell.swift
//  Solfeggio
//
//  Created by Давид Васильев on 08.04.2024.
//
import SnapKit
import UIKit

class MainScreenCollectionViewCell: UICollectionViewCell {

//    private var customView: GradientView = GradientView()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .mySPink
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MainScreenSubCollectionViewCell.self, forCellWithReuseIdentifier: MainScreenSubCollectionViewCell.reuseIdentifier)

        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(colors: [UIColor]) {
//        customView.setUpGradient(color1: colors[0], color2: colors[1])

    }

    private func setUp() {
        setUpTopicsCollectionView()
    }

    private func setUpTopicsCollectionView() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview()
        }
    }
}

extension MainScreenCollectionViewCell: UICollectionViewDelegateFlowLayout, UICalendarViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MainScreenSubCollectionViewCell.reuseIdentifier, for: indexPath) as? MainScreenSubCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.configure(colors: [.myBlue, .myCyan])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Укажите размер ячейки здесь
        return CGSize(width: 280, height: 180) // Пример размера ячейки (ширина, высота)
    }
}
