//
//  TopicLevelScreenView.swift
//  Solfeggio
//
//  Created by Давид Васильев on 01.04.2024.
//

import SnapKit
import UIKit

class TopicLevelsScreenView: UIView {

    private lazy var exitButton: UIButton = UIButton()
    private lazy var progressView: UIProgressView = UIProgressView(progressViewStyle: .default)
    private lazy var progressLabel: UILabel = UILabel()

    var exitClosure: (() -> Void)?

    lazy var levelsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        self.backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        setUpExitButton()
        setUpProgressView()
        setUpProgressLabel()
        setUpLevelsCollectionView()
    }

    private func setUpLevelsCollectionView() {
        addSubview(levelsCollectionView)
        levelsCollectionView.backgroundColor = .clear
        levelsCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(progressLabel.snp_bottomMargin).offset(20)
            make.bottom.equalToSuperview()
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

    private func setUpProgressView() {
        addSubview(progressView)
        progressView.layer.cornerRadius = 10
        progressView.layer.masksToBounds = true
        progressView.progressTintColor = .green
        progressView.trackTintColor = .myCyanop
        progressView.snp.makeConstraints { make in
            make.top.equalTo(70)
            make.leading.equalTo(80)
            make.height.equalTo(20)
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        progressView.setProgress(0.3, animated: true)
    }

    private func setUpProgressLabel() {
        addSubview(progressLabel)
        progressLabel.text = "Прогресс темы"
        progressLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        progressLabel.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp_bottomMargin).offset(8)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
    }
}
