//
//  AuthorizationView.swift
//  Solfeggio
//
//  Created by Давид Васильев on 26.05.2024.
//

import UIKit

class AuthorizationView: UIView {
    private lazy var exitButton: UIButton = UIButton()
    private lazy var topImageView: UIImageView = UIImageView()
    private lazy var backView: UIView = UIView()
    lazy var loginTextField: UITextField = UITextField()
    lazy var passwordTextField: UITextField = UITextField()
    private lazy var authorizationButton: UIButton = UIButton()
    var currentImage: Int = 0

    var exitClosure: (() -> Void)?
    var authorizeClosure: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        self.backgroundColor = .pBlue
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        setUpExitButton()
        setUpTopImageView()
        setUpBackView()
        setUpLoginTextField()
        setUpPasswordTextField()
        setUpAuthorizeButton()
    }

    private func setUpTopImageView() {
        addSubview(topImageView)
        topImageView.image = .login2
        topImageView.contentMode = .scaleAspectFill
        topImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(140)
            make.centerX.equalToSuperview()
            make.width.equalTo(360)
            make.height.equalTo(220)
        }
    }

    private func setUpExitButton() {
        addSubview(exitButton)
        let action: UIAction = UIAction { [weak self] _ in
            self?.exitClosure?()
        }
        exitButton.addAction(action, for: .touchUpInside)
        exitButton.setImage(.exit, for: .normal)
        exitButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.leading.equalToSuperview().offset(22)
            make.height.equalTo(36)
            make.width.equalTo(36)
        }
    }

    private func setUpBackView() {
        addSubview(backView)
        backView.backgroundColor = .pDarkBlue
        backView.layer.cornerRadius = 16
        backView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(220)
            make.centerX.equalToSuperview()
            make.width.equalTo(360)
            make.height.equalTo(280)
        }
    }

    private func setUpLoginTextField() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        backView.addSubview(loginTextField)
        loginTextField.placeholder = "Login"
        loginTextField.leftView = paddingView
        loginTextField.leftViewMode = .always
        loginTextField.backgroundColor = .myWhiteop
        loginTextField.layer.cornerRadius = 8
        loginTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }
    }

    private func setUpPasswordTextField() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        backView.addSubview(passwordTextField)
        passwordTextField.placeholder = "Password"
        passwordTextField.leftView = paddingView
        passwordTextField.textContentType = .oneTimeCode
        passwordTextField.isSecureTextEntry = true
        passwordTextField.leftViewMode = .always
        passwordTextField.backgroundColor = .myWhiteop
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(loginTextField.snp_bottomMargin).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }
    }

    private func setUpAuthorizeButton() {
        backView.addSubview(authorizationButton)
        let action: UIAction = UIAction { [weak self] _ in
            self?.authorizeClosure?()
        }
        authorizationButton.addAction(action, for: .touchUpInside)
        authorizationButton.setTitle("Авторизоваться", for: .normal)
        authorizationButton.setTitleColor(.white, for: .normal)
        authorizationButton.backgroundColor = .pIndigoOp
        authorizationButton.layer.cornerRadius = 10
        authorizationButton.layer.masksToBounds = true
        authorizationButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }
    }
}
