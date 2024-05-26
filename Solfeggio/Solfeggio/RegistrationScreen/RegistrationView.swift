//
//  RegistrationView.swift
//  Solfeggio
//
//  Created by Давид Васильев on 25.05.2024.
//

import UIKit

class RegistrationView: UIView {
    private lazy var exitButton: UIButton = UIButton()
    private lazy var topImageView: UIImageView = UIImageView()
    private lazy var backView: UIView = UIView()
    lazy var nameTextField: UITextField = UITextField()
    lazy var loginTextField: UITextField = UITextField()
    lazy var passwordTextField: UITextField = UITextField()
    private lazy var chooseImageLabel: UILabel = UILabel()
    private lazy var maleImageView: UIImageView = UIImageView()
    private lazy var femaleImageView: UIImageView = UIImageView()
    private lazy var checkmark1ImageView: UIImageView = UIImageView()
    private lazy var checkmark2ImageView: UIImageView = UIImageView()
    private lazy var registrationButton: UIButton = UIButton()
    var currentImage: Int = 0

    var exitClosure: (() -> Void)?
    var registerClosure: (() -> Void)?

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
        setUpNameTextField()
        setUpLoginTextField()
        setUpPasswordTextField()
        setUpChooseImageLabel()
        setUpMaleUIImageView()
        setUpFemaleUIImageView()
        setUpRegisterButton()
    }

    private func setUpTopImageView() {
        addSubview(topImageView)
        topImageView.image = .register
        topImageView.contentMode = .scaleAspectFill
        topImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(360)
            make.height.equalTo(100)
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
            make.bottom.equalToSuperview().inset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(360)
            make.height.equalTo(500)
        }
    }

    private func setUpNameTextField() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
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
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
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

    private func setUpChooseImageLabel() {
        backView.addSubview(chooseImageLabel)
        chooseImageLabel.text = "Выберите аватарку"
        chooseImageLabel.font = UIFont.boldSystemFont(ofSize: 18)
        chooseImageLabel.textColor = .white
        chooseImageLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp_bottomMargin).offset(30)
            make.centerX.equalToSuperview()
        }
    }

    private func setUpMaleUIImageView() {
        backView.addSubview(maleImageView)
        maleImageView.image = .avatar
        maleImageView.layer.borderWidth = 1
        maleImageView.layer.masksToBounds = false
        maleImageView.layer.borderColor = UIColor.white.cgColor
        maleImageView.layer.cornerRadius = 60
        maleImageView.clipsToBounds = true
        maleImageView.isUserInteractionEnabled = true
        maleImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(maleImageViewTapped)))
        maleImageView.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp_bottomMargin).offset(60)
            make.leading.equalToSuperview().offset(20)
            make.width.height.equalTo(120)
        }
    }

    @objc func maleImageViewTapped() {
        if currentImage == 0 {
            currentImage = 1
            setUpCheckmark1ImageView()
        } else if currentImage == 2 {
            currentImage = 1
            checkmark2ImageView.removeFromSuperview()
            setUpCheckmark1ImageView()
            self.femaleImageView.alpha = 1
        }
    }

    private func setUpCheckmark1ImageView() {
        self.maleImageView.alpha = 0.5
        self.checkmark1ImageView.alpha = 0.2
        self.checkmark1ImageView.image = .ok
        self.checkmark1ImageView.isHidden = false
        self.checkmark1ImageView.layer.borderWidth = 1
        self.checkmark1ImageView.layer.masksToBounds = false
        self.checkmark1ImageView.layer.borderColor = UIColor.white.cgColor
        self.checkmark1ImageView.layer.cornerRadius = 60
        self.checkmark1ImageView.clipsToBounds = true
        UIView.animate(withDuration: 0.5) {
            self.backView.addSubview(self.checkmark1ImageView)
            self.checkmark1ImageView.snp.makeConstraints { make in
                make.top.equalTo(self.passwordTextField.snp_bottomMargin).offset(60)
                make.leading.equalToSuperview().offset(20)
                make.width.height.equalTo(120)
            }
        }
    }

    private func setUpFemaleUIImageView() {
        backView.addSubview(femaleImageView)
        femaleImageView.image = .avatar2
        femaleImageView.layer.borderWidth = 1
        femaleImageView.layer.masksToBounds = false
        femaleImageView.layer.borderColor = UIColor.white.cgColor
        femaleImageView.layer.cornerRadius = 60
        femaleImageView.clipsToBounds = true
        femaleImageView.isUserInteractionEnabled = true
        femaleImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(femaleImageViewTapped)))
        femaleImageView.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp_bottomMargin).offset(60)
            make.trailing.equalToSuperview().inset(20)
            make.width.height.equalTo(120)
        }
    }

    @objc func femaleImageViewTapped() {
        if currentImage == 0 {
            currentImage = 2
            setUpCheckmark2ImageView()
        } else if currentImage == 1 {
            currentImage = 2
            checkmark1ImageView.removeFromSuperview()
            setUpCheckmark2ImageView()
            self.maleImageView.alpha = 1
        }
    }

    private func setUpCheckmark2ImageView() {
        self.backView.addSubview(self.checkmark2ImageView)
        self.femaleImageView.alpha = 0.5
        self.checkmark2ImageView.alpha = 0.2
        self.checkmark2ImageView.image = .ok
        self.checkmark2ImageView.isHidden = false
        self.checkmark2ImageView.layer.borderWidth = 1
        self.checkmark2ImageView.layer.masksToBounds = false
        self.checkmark2ImageView.layer.borderColor = UIColor.white.cgColor
        self.checkmark2ImageView.layer.cornerRadius = 60
        self.checkmark2ImageView.clipsToBounds = true
        UIView.animate(withDuration: 0.5) {
            self.checkmark2ImageView.snp.makeConstraints { make in
                make.top.equalTo(self.passwordTextField.snp_bottomMargin).offset(60)
                make.trailing.equalToSuperview().inset(20)
                make.width.height.equalTo(120)
            }
        }
    }

    private func setUpRegisterButton() {
        backView.addSubview(registrationButton)
        let action: UIAction = UIAction { [weak self] _ in
            self?.registerClosure?()
        }
        registrationButton.addAction(action, for: .touchUpInside)
        registrationButton.setTitle("Зарегистрироваться", for: .normal)
        registrationButton.setTitleColor(.white, for: .normal)
        registrationButton.backgroundColor = .pIndigoOp
        registrationButton.layer.cornerRadius = 10
        registrationButton.layer.masksToBounds = true
        registrationButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }
    }

}
