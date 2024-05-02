//
//  KnowledgeRepetitionChossingTopicsCollectionViewCell.swift
//  Solfeggio
//
//  Created by Давид Васильев on 26.04.2024.
//

import UIKit

class KnowRepChossingTopicsCollectionViewCell: UICollectionViewCell {

    private lazy var titleLabel: UILabel = UILabel()
    private lazy var imageView: UIImageView = UIImageView()
    private var customView: UIView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        customView.removeFromSuperview()
    }

    func configure(title: String, image: UIImage) {
        titleLabel.text = title
        imageView.image = image
        setUpSecondCell()
    }

    func configure(color: UIColor, title: String) {
        customView = CustomViewBuilder()
            .addBackgroundColor(color)
            .addTitle(title)
            .addSwitchButton()
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

    private func setUpSecondCell() {
        setUpTitleLabel()
        setUpImage()
    }

    private func setUpImage() {
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }

    private func setUpTitleLabel() {
        addSubview(titleLabel)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 26.0)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(38)
        }
    }
}
