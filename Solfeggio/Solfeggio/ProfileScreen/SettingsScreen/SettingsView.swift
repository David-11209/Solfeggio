//
//  SettingsView.swift
//  Solfeggio
//
//  Created by Давид Васильев on 28.05.2024.
//

import UIKit

class SettingsView: UIView {
    private lazy var exitButton: UIButton = UIButton()
    private lazy var exitAccountButton: UIButton = UIButton()

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
        setUpExitAccountButton()
        setUpExitButton()
    }

    private func setUpExitAccountButton() {
        addSubview(exitAccountButton)
        let action: UIAction = UIAction { [weak self] _ in
            self?.exitClosure?("exitAccont")
        }
        exitAccountButton.backgroundColor = .pPurple
        exitAccountButton.setTitle("Выйти из аккаунта", for: .normal)
        exitAccountButton.titleLabel?.font = .boldSystemFont(ofSize: 26)
        exitAccountButton.titleLabel?.textColor = .black
        exitAccountButton.layer.cornerRadius = 16
        exitAccountButton.layer.masksToBounds = false
        exitAccountButton.layer.shadowColor = UIColor.black.cgColor
        exitAccountButton.layer.shadowOpacity = 0.5
        exitAccountButton.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        exitAccountButton.layer.shadowRadius = 5.0
        exitAccountButton.layer.borderColor = UIColor.black.cgColor
        exitAccountButton.addAction(action, for: .touchUpInside)
        exitAccountButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.centerX.equalToSuperview()
            make.height.equalTo(80)
            make.width.equalTo(300)
        }
    }

    private func setUpExitButton() {
        addSubview(exitButton)
        let action: UIAction = UIAction { [weak self] _ in
            self?.exitClosure?("exitScreen")
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

}
