//
//  SignInView.swift
//  Solfeggio
//
//  Created by Давид Васильев on 24.05.2024.
//

import UIKit

class SignInView: UIView {

    private lazy var imageView: UIImageView = UIImageView()
    private lazy var titleLabel: UILabel = UILabel()
    private lazy var registerButton: UIButton = UIButton()
    private lazy var authorizeButton: UIButton = UIButton()

    var exitClosure: ((String) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        self.backgroundColor = .pBlue
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        setUpTitleLabel()
        setUpImageView()
        setUpRegisterButton()
        setUpAuthorizeButton()
    }

    private func setUpTitleLabel() {
        addSubview(titleLabel)
        titleLabel.text = "Вы не вошли в систему"
        titleLabel.textAlignment = .center
        titleLabel.font = .boldSystemFont(ofSize: 32)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(60)
        }
    }

    private func setUpImageView() {
        addSubview(imageView)
        imageView.image = .login
        imageView.contentMode = .scaleAspectFill
        imageView.snp.makeConstraints { make in
            make.width.equalTo(380)
            make.height.equalTo(300)
            make.top.equalTo(titleLabel.snp_bottomMargin).offset(20)
            make.centerX.equalToSuperview()
        }
    }

    private func setUpRegisterButton() {
        addSubview(registerButton)
        let action: UIAction = UIAction { [weak self] _ in
            self?.exitClosure?("register")
        }
        registerButton.backgroundColor = .pPurple
        registerButton.setTitle("Регистрация", for: .normal)
        registerButton.titleLabel?.font = .boldSystemFont(ofSize: 26)
        registerButton.titleLabel?.textColor = .black
        registerButton.layer.cornerRadius = 16
        registerButton.layer.masksToBounds = false
        registerButton.layer.shadowColor = UIColor.black.cgColor
        registerButton.layer.shadowOpacity = 0.5
        registerButton.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        registerButton.layer.shadowRadius = 5.0
        registerButton.layer.borderColor = UIColor.black.cgColor
        registerButton.addAction(action, for: .touchUpInside)
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp_bottomMargin).offset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(80)
            make.width.equalTo(300)
        }
    }

    private func setUpAuthorizeButton() {
        addSubview(authorizeButton)
        let action: UIAction = UIAction { [weak self] _ in
            self?.exitClosure?("authorize")
        }
        authorizeButton.backgroundColor = .pRed
        authorizeButton.setTitle("Автортизация", for: .normal)
        authorizeButton.titleLabel?.font = .boldSystemFont(ofSize: 26)
        authorizeButton.titleLabel?.textColor = .black
        authorizeButton.layer.cornerRadius = 16
        authorizeButton.layer.masksToBounds = false
        authorizeButton.layer.shadowColor = UIColor.black.cgColor
        authorizeButton.layer.shadowOpacity = 0.5
        authorizeButton.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        authorizeButton.layer.shadowRadius = 5.0
        authorizeButton.layer.borderColor = UIColor.black.cgColor
        authorizeButton.addAction(action, for: .touchUpInside)
        authorizeButton.snp.makeConstraints { make in
            make.top.equalTo(registerButton.snp_bottomMargin).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(80)
            make.width.equalTo(300)
        }
    }
}
