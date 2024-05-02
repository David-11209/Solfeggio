//
//  LevelsCollectionViewCell.swift
//  Solfeggio
//
//  Created by Давид Васильев on 01.04.2024.
//
import SnapKit
import UIKit

class LevelsCollectionViewCell: UICollectionViewCell {

    private var customView: UIView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        customView.removeFromSuperview()
    }

    func configure(color: UIColor, image: UIImage, title: String) {
        customView = CustomViewBuilder()
            .addBackgroundColor(color)
            .addImage(image)
            .addTitle(title)
            .build()
        setUp()
    }

    func configure(color: UIColor, mainTitle: String, title: String) {
        customView = CustomViewBuilder()
            .addBackgroundColor(color)
            .addMainLabel(mainTitle)
            .addTitle(title)
            .build()
        setUp()
    }

    private func setUp() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().inset(5)
            make.trailing.equalToSuperview().inset(5)
        }
    }
}
