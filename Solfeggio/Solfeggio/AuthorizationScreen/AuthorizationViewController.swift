//
//  AuthorizationViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 26.05.2024.
//

import UIKit

class AuthorizationViewController: UIViewController, UITextFieldDelegate {
    private let contentView: AuthorizationView
    private var viewModel: AuthorizationViewModelProtocol
    var exitClosure: (() -> Void)?
    var authorizeClosure: (() -> Void)?

    init(viewModel: AuthorizationViewModelProtocol) {
        self.viewModel = viewModel
        self.contentView = AuthorizationView()
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

        contentView.loginTextField.delegate = self
        contentView.loginTextField.tag = 1

        contentView.passwordTextField.delegate = self
        contentView.passwordTextField.tag = 2

        contentView.exitClosure = {
            self.exitClosure?()
        }

        contentView.authorizeClosure = {
            let loginText = self.contentView.loginTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let passwordText = self.contentView.passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)

            guard let loginText = loginText, !loginText.isEmpty,
                let passwordText = passwordText, !passwordText.isEmpty else {
                let alert = UIAlertController(title: "Ошибка", message: "Пожалуйста, заполните все поля", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true)
                return
            }
            self.viewModel.addAuthorizationInfo(login: loginText, password: passwordText)
            self.authorizeClosure?()
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
