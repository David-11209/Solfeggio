//
//  KnowledgeRepetitionChossingTopicsCollectionViewCell.swift
//  Solfeggio
//
//  Created by Давид Васильев on 26.04.2024.
//

import SnapKit
import UIKit

class KnowRepChossingTopicsCollectionViewCell: UICollectionViewCell {

    private lazy var titleLabel: UILabel = UILabel()
    private lazy var imageView: UIImageView = UIImageView()
    private lazy var switchButton: UISwitch = UISwitch()
    var switchClosure: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpView() {
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowRadius = 5.0
        self.layer.borderColor = UIColor.black.cgColor
    }

//    override func prepareForReuse() {
//        super.prepareForReuse()
//        customView.removeFromSuperview()
//    }

    func configure(title: String, image: UIImage) {
        titleLabel.text = title
        imageView.image = image
        setUpSecondCell()
    }

    func configure(color: UIColor, title: String) {
        backgroundColor = color
        titleLabel.text = title
    }

    private func setUp() {
        setUpView()
        setUpTitleLabel()
        setUpSwitchButton()
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
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(38)
        }
    }

    private func setUpSwitchButton() {
        addSubview(switchButton)
        switchButton.onTintColor = .myWhiteop
        switchButton.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            if self.switchButton.isOn {
                switchClosure?()
                print("Переключатель включен")
            } else {
                switchClosure?()
                print("Переключатель выключен")
            }
        }), for: .valueChanged)

        switchButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
        }
    }
}
