//
//  RegistrationView.swift
//  Solfeggio
//
//  Created by Давид Васильев on 25.05.2024.
//

import UIKit

class RegistrationView: UIView {
    private lazy var backView: UIView = UIView()
    private lazy var nameTextField: UITextField = UITextField()
    private lazy var loginTextField: UITextField = UITextField()
    private lazy var passwordTextField: UITextField = UITextField()
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        self.backgroundColor = .pBlue
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        setUpBackView()
        setUpNameTextField()
        setUpLoginTextField()
    }

    private func setUpBackView() {
        addSubview(backView)
        backView.backgroundColor = .pDarkBlue
        backView.layer.cornerRadius = 16
        backView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(360)
            make.height.equalTo(500)
        }
    }
        ///делегат
    private func setUpNameTextField() {
        backView.addSubview(nameTextField)
        nameTextField.placeholder = "Имя"

        nameTextField.leftView = paddingView
        nameTextField.leftViewMode = .always
        nameTextField.backgroundColor = .myWhiteop
        nameTextField.layer.cornerRadius = 8
        nameTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }
    }

    private func setUpLoginTextField() {
        backView.addSubview(loginTextField)
        loginTextField.placeholder = "Login"
        loginTextField.leftView = paddingView
        loginTextField.leftViewMode = .always
        loginTextField.backgroundColor = .myWhiteop
        loginTextField.layer.cornerRadius = 8
        loginTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp_bottomMargin).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }
    }
}
