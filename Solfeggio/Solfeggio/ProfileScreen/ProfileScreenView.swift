//
//  ProfileScreenView.swift
//  Solfeggio
//
//  Created by Давид Васильев on 15.04.2024.
//

import SnapKit
import UIKit

class ProfileScreenView: UIView {

    private lazy var headerView: UIView = UIView()
    private lazy var settingsButton: UIButton = UIButton()
    private lazy var nameScreenLabel: UILabel = UILabel()
    private lazy var profileImage: UIImageView = UIImageView()
    private lazy var nameUserLabel: UILabel = UILabel()
    private lazy var statisticImage: UIImageView = UIImageView()
    private lazy var statisticLabel: UILabel = UILabel()
    private lazy var daysStraightView: UIView = UIView()
    private lazy var solvedTasksView: UIView = UIView()
    private lazy var whiteView: UIView = UIView()
    private lazy var whiteViewTitle: UILabel = UILabel()
    private lazy var procentView: UIView = UIView()
    private lazy var tasksSolvedLabel: UILabel = UILabel()
    private lazy var procentLabel: UILabel = UILabel()
    private lazy var separatorView: UIView = UIView()
    private lazy var notesProgressLabel: UILabel = UILabel()
    private lazy var notesProgressView: UIProgressView = UIProgressView(progressViewStyle: .default)
    private lazy var intervalsProgressLabel: UILabel = UILabel()
    private lazy var intervalsProgressView: UIProgressView = UIProgressView(progressViewStyle: .default)
    private lazy var moodsProgressLabel: UILabel = UILabel()
    private lazy var moodsProgressView: UIProgressView = UIProgressView(progressViewStyle: .default)
    private lazy var chordsProgressLabel: UILabel = UILabel()
    private lazy var chordsProgressView: UIProgressView = UIProgressView(progressViewStyle: .default)
    private lazy var progressStack: UIStackView = UIStackView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        self.backgroundColor = .pBlue
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        setUpHeaderView()
        setUpSettingsButton()
        setUpNameScreenLabel()
        setUpProfileImage()
        setUpNameUserLabel()
        setUpWhiteView()
        setUpStatisticImage()
        setUpStatisticLabel()
        setUpProcentView()
        setUpTasksSolvedLabel()
        setUpProcentLabel()
        setUpSeparatorView()

        setUpProgressLabel(progressLabel: notesProgressLabel, text: "Ноты")
        setUpProgressView(progressView: notesProgressView, color: .pRed, trackColor: .pRedOp)

        setUpProgressLabel(progressLabel: intervalsProgressLabel, text: "Интервалы")
        setUpProgressView(progressView: intervalsProgressView, color: .pPurple, trackColor: .pPurpleOp)

        setUpProgressLabel(progressLabel: moodsProgressLabel, text: "Лады")
        setUpProgressView(progressView: moodsProgressView, color: .pOrange, trackColor: .pOrangeOp)

        setUpProgressLabel(progressLabel: chordsProgressLabel, text: "Аккорды")
        setUpProgressView(progressView: chordsProgressView, color: .pIndigo, trackColor: .pIndigoOp)

        setUpStackView()
    }

    private func setUpHeaderView() {
        addSubview(headerView)
        headerView.backgroundColor = .white
        setUpShadow()
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-10)
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(300)
        }
    }

    private func setUpShadow() {
        headerView.layer.cornerRadius = 42
        headerView.layer.masksToBounds = false
        headerView.layer.shadowColor = UIColor.black.cgColor
        headerView.layer.shadowOpacity = 0.5
        headerView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        headerView.layer.shadowRadius = 5.0
        headerView.layer.borderColor = UIColor.black.cgColor
    }

    private func setUpSettingsButton() {
        headerView.addSubview(settingsButton)
        settingsButton.setImage(.settings, for: .normal)
        settingsButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(68)
            make.leading.equalToSuperview().inset(20)
            make.height.width.equalTo(40)
        }
    }

    private func setUpNameScreenLabel() {
        headerView.addSubview(nameScreenLabel)
        nameScreenLabel.text = "Профиль"
        nameScreenLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        nameScreenLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(68)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
        }
    }

    private func setUpProfileImage() {
        headerView.addSubview(profileImage)
        profileImage.image = .avatar
        profileImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(118)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(100)
        }
    }

    private func setUpNameUserLabel() {
        headerView.addSubview(nameUserLabel)
        nameUserLabel.text = "Иван Иванов"
        nameUserLabel.font = UIFont.boldSystemFont(ofSize: 26.0)
        nameUserLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(220)
            make.centerX.equalToSuperview()
            make.height.equalTo(80)
        }
    }

    private func setUpStatisticImage() {
        whiteView.addSubview(statisticImage)
        statisticImage.image = .statistic
        statisticImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(30)
            make.height.width.equalTo(40)
        }
    }

    private func setUpStatisticLabel() {
        whiteView.addSubview(statisticLabel)
        statisticLabel.text = "Статистика слуха"
        statisticLabel.font = UIFont.boldSystemFont(ofSize: 26.0)
        statisticLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.leading.equalToSuperview().offset(80)
            make.height.equalTo(40)
        }
    }

    private func setUpWhiteView() {
        addSubview(whiteView)
        whiteView.backgroundColor = .white
        whiteView.layer.cornerRadius = 18
        whiteView.layer.masksToBounds = true
        whiteView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(100)
            make.centerX.equalToSuperview()
            make.height.equalTo(280)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
    }

    private func setUpWhiteViewTitle() {
        whiteView.addSubview(whiteViewTitle)
        whiteViewTitle.text = "Музыкальный слух"
        whiteViewTitle.font = UIFont.boldSystemFont(ofSize: 26.0)
        whiteViewTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
        }
    }

    private func setUpStackView() {
        whiteView.addSubview(progressStack)
        progressStack.axis = .vertical
        progressStack.distribution = .equalSpacing
        progressStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(75)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
    }

    private func setUpProgressView(progressView: UIProgressView, color: UIColor, trackColor: UIColor) {
        progressStack.addArrangedSubview(progressView)
        progressView.layer.cornerRadius = 8
        progressView.layer.masksToBounds = true
        progressView.progressTintColor = color
        progressView.trackTintColor = trackColor
        progressView.setProgress(0.3, animated: true)
        progressView.snp.makeConstraints { make in
            make.height.equalTo(14)
        }
    }

    private func setUpProgressLabel(progressLabel: UILabel, text: String) {
        progressStack.addArrangedSubview(progressLabel)
        progressLabel.text = text
        progressLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        progressLabel.snp.makeConstraints { make in
            make.height.equalTo(34)
        }
    }

    private func setUpProcentView() {
        addSubview(procentView)
        procentView.backgroundColor = .white
        procentView.layer.cornerRadius = 18
        procentView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(400)
            make.centerX.equalToSuperview()
            make.height.equalTo(80)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
    }

    private func setUpTasksSolvedLabel() {
        procentView.addSubview(tasksSolvedLabel)
        tasksSolvedLabel.text = "Решено заданий"
        tasksSolvedLabel.font = UIFont.boldSystemFont(ofSize: 26.0)
        tasksSolvedLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
        }
    }

    private func setUpProcentLabel() {
        procentView.addSubview(procentLabel)
        procentLabel.text = "25%"
        procentLabel.font = UIFont.boldSystemFont(ofSize: 26.0)
        procentLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
        }
    }

    private func setUpSeparatorView() {
        whiteView.addSubview(separatorView)
        separatorView.backgroundColor = .lightGray
        separatorView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(62)
            make.centerX.equalToSuperview()
            make.height.equalTo(3)
            make.width.equalToSuperview()
        }
    }
}
