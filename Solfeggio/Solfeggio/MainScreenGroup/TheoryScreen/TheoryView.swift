//
//  TheoryView.swift
//  Solfeggio
//
//  Created by Давид Васильев on 28.05.2024.
//

import UIKit

class TheoryView: UIView {

    private lazy var imageView: UIImageView = UIImageView()
    private lazy var exitButton: UIButton = UIButton()
    private lazy var contentView: UIView = UIView()
    private lazy var textView: UITextView = UITextView()
    private lazy var detailImageView: UIImageView = UIImageView()

    var exitClosure: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        self.backgroundColor = .pBlue
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        setUpImageView()
        setUpExitButton()
        setUpContentView()
        setUpTextView()
        setUpDetailImageView()
    }

    func config(text: String, image: UIImage) {
        textView.text = text
        detailImageView.image = image

    }

    private func setUpImageView() {
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.image = .readBook
        imageView.snp.makeConstraints { make in
            make.width.equalTo(380)
            make.height.equalTo(200)
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
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

    private func setUpContentView() {
        addSubview(contentView)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = false
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        contentView.layer.shadowRadius = 5.0
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp_bottomMargin).offset(60)
            make.height.equalTo(450)
            make.width.equalTo(330)
            make.centerX.equalToSuperview()
        }
    }

    private func setUpTextView() {
        contentView.addSubview(textView)
        textView.font = UIFont.systemFont(ofSize: 18.0)
        textView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(260)
            make.width.equalTo(300)
            make.centerX.equalToSuperview()
        }
    }

    private func setUpDetailImageView() {
        contentView.addSubview(detailImageView)
        detailImageView.image = .readBook
        detailImageView.snp.makeConstraints { make in
            make.top.equalTo(textView.snp.bottom).offset(40)
            make.height.equalTo(100)
            make.width.equalTo(330)
            make.centerX.equalToSuperview()
        }
    }
}
