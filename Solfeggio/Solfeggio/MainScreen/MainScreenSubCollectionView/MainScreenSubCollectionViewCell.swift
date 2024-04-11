//
//  MainScreenSubCollectionViewCell.swift
//  Solfeggio
//
//  Created by Давид Васильев on 08.04.2024.
//

import UIKit

class MainScreenSubCollectionViewCell: UICollectionViewCell {

    private var customView: GradientView = GradientView()
    private lazy var titleLabel: UILabel = UILabel()
    private lazy var progressView: UIProgressView = UIProgressView(progressViewStyle: .default)
    private lazy var progressLabel: UILabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(colors: [UIColor], title: String, progressProcent: String) {
        titleLabel.text = title
        progressLabel.text = "Прогресс " + progressProcent
        customView.setUpGradient(color1: colors[0], color2: colors[1])
    }

    private func setUp() {
        setUpCustomView()
        setUpTitleLabel()
        setUpProgressLabel()
        setUpProgressView()
    }

    private func setUpCustomView() {
        contentView.addSubview(customView)
        customView.layer.cornerRadius = 30
        customView.layer.masksToBounds = false
        customView.layer.shadowColor = UIColor.black.cgColor
        customView.layer.shadowOpacity = 0.5
        customView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        customView.layer.shadowRadius = 5.0
        customView.layer.borderColor = UIColor.black.cgColor
        customView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(300)
            make.bottom.equalToSuperview().inset(5)
        }
    }

    private func setUpTitleLabel() {
        customView.addSubview(titleLabel)
        titleLabel.text = "Ноты и длительности"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        titleLabel.textAlignment = .center
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(40)
        }
    }

    private func setUpProgressLabel() {
        customView.addSubview(progressLabel)
        progressLabel.text = "Прогресс 57%"
        progressLabel.textColor = .white
        progressLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        progressLabel.snp.makeConstraints { make in
            make.top.equalTo(120)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
    }

    private func setUpProgressView() {
        customView.addSubview(progressView)
        progressView.layer.cornerRadius = 10
        progressView.layer.masksToBounds = true
        progressView.progressTintColor = .white
        progressView.trackTintColor = .myWhiteop
        progressView.snp.makeConstraints { make in
            make.top.equalTo(progressLabel.snp_bottomMargin).offset(12)
            make.centerX.equalToSuperview()
            make.height.equalTo(16)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        progressView.setProgress(0.3, animated: true)
    }
}
