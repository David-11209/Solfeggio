//
//  RegistrationViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 25.05.2024.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {

    private let contentView: RegistrationView
    private var viewModel: RegistrationViewModelProtocol
    var exitClosure: (() -> Void)?
    var showProfileScreen: (() -> Void)?

    init(viewModel: RegistrationViewModelProtocol) {
        self.viewModel = viewModel
        self.contentView = RegistrationView()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.nameTextField.delegate = self
        contentView.nameTextField.tag = 1

        contentView.loginTextField.delegate = self
        contentView.loginTextField.tag = 2

        contentView.passwordTextField.delegate = self
        contentView.passwordTextField.tag = 3

        contentView.exitClosure = {
            self.exitClosure?()
        }

        viewModel.resultClosure = { result in
            if result {
                self.showProfileScreen?()
            } else {
                let alert = UIAlertController(title: "Ошибка", message: "Пользователь с таким логином уже есть", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true)
            }
        }

        contentView.registerClosure = {
            let nameText = self.contentView.nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let loginText = self.contentView.loginTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let passwordText = self.contentView.passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let image = self.contentView.currentImage

            guard let nameText = nameText, !nameText.isEmpty,
                let loginText = loginText, !loginText.isEmpty,
                let passwordText = passwordText, !passwordText.isEmpty,
                image != 0 else {
                let alert = UIAlertController(title: "Ошибка", message: "Пожалуйста, заполните все поля и выберите аватарку", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true)
                return
            }
            self.viewModel.addRegistrationInfo(name: nameText, login: loginText, password: passwordText, image: image)
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
