//
//  EndLevelScreenView.swift
//  Solfeggio
//
//  Created by Давид Васильев on 06.05.2024.
//

import UIKit
import JGProgressHUD

class EndLevelScreenView: UIView {

    private lazy var imageView: UIImageView = UIImageView()
    private lazy var titleLabel: UILabel = UILabel()
    private lazy var retryButton: UIButton = UIButton()
    private lazy var exitButton: UIButton = UIButton()

    var exitClosure: ((String) -> Void)?

    init(frame: CGRect, result: Bool) {
        super.init(frame: frame)
        if result {
            setUp(image: .sucsesfulLevel, titleText: "Вы прошли уровень!")
        } else {
            setUp(image: .fail, titleText: "Вы не прошли уровень")
        }

        self.backgroundColor = .pBlue
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp(image: UIImage, titleText: String) {
        setUpImageView(image: image)
        setUpTitleLabel(titleText: titleText)
        setUpRetryButton()
        setUpExitButton()
    }

    private func setUpImageView(image: UIImage) {
        addSubview(imageView)
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(160)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(280)
        }
    }

    private func setUpTitleLabel(titleText: String) {
        addSubview(titleLabel)
        titleLabel.text = titleText
        titleLabel.font = .boldSystemFont(ofSize: 32)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp_bottomMargin).offset(20)
            make.centerX.equalToSuperview()
        }
    }

    private func setUpRetryButton() {
        addSubview(retryButton)
        let action: UIAction = UIAction { [weak self] _ in
            self?.exitClosure?("retry")
        }
        retryButton.backgroundColor = .pOrange
        retryButton.setTitle("Заново", for: .normal)
        retryButton.titleLabel?.font = .systemFont(ofSize: 26)
        retryButton.titleLabel?.textColor = .black
        retryButton.layer.cornerRadius = 16
        retryButton.layer.masksToBounds = false
        retryButton.layer.shadowColor = UIColor.black.cgColor
        retryButton.layer.shadowOpacity = 0.5
        retryButton.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        retryButton.layer.shadowRadius = 5.0
        retryButton.layer.borderColor = UIColor.black.cgColor
        retryButton.addAction(action, for: .touchUpInside)
        retryButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp_bottomMargin).offset(100)
            make.centerX.equalToSuperview()
            make.height.equalTo(80)
            make.width.equalTo(300)
        }
    }

    private func setUpExitButton() {
        addSubview(exitButton)
        let action: UIAction = UIAction { [weak self] _ in
            self?.exitClosure?("exit")
        }
        exitButton.backgroundColor = .pPink
        exitButton.setTitle("Вернуться", for: .normal)
        exitButton.titleLabel?.font = .systemFont(ofSize: 26)
        exitButton.titleLabel?.textColor = .black
        exitButton.layer.cornerRadius = 16
        exitButton.layer.masksToBounds = false
        exitButton.layer.shadowColor = UIColor.black.cgColor
        exitButton.layer.shadowOpacity = 0.5
        exitButton.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        exitButton.layer.shadowRadius = 5.0
        exitButton.layer.borderColor = UIColor.black.cgColor
        exitButton.addAction(action, for: .touchUpInside)
        exitButton.snp.makeConstraints { make in
            make.top.equalTo(retryButton.snp_bottomMargin).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(80)
            make.width.equalTo(300)
        }
    }
}
