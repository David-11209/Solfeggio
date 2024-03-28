//
//  HearingTestLevelScreenView.swift
//  Solfeggio
//
//  Created by Давид Васильев on 28.03.2024.
//

import UIKit

class HearingTestLevelScreenView: UIView {

    private lazy var exitButton: UIButton = UIButton()
    private lazy var progressView: UIProgressView = UIProgressView(progressViewStyle: .default)
    private lazy var progressLabel: UILabel = UILabel()
    private var taskView: GradientTaskView?
    private lazy var taskLabel: UILabel = UILabel()
    private var customView: UIView = UIView()
    private var buttonsStackView: ButtonsStackView?

    var startStopButtonTapped: (() -> Void)?

    init(frame: CGRect, text: String, image: UIImage? = nil, buttonsNames: [String]) {
        super.init(frame: frame)
        taskView = GradientTaskView(frame: frame, text: text, color1: .myLightblue, color2: .myLightGreen)
        buttonsStackView = ButtonsStackView(names: buttonsNames, color: .myCyan)
        if image != nil {
            setUpWithTextAndImage()
        } else {
            setUpWithText()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpWithText() {
        setUpExitButton()
        setUpProgressView()
        setUpProgressLabel()
        setUpTaskView()
        setUpButtonsStackView()
    }

    private func setUpWithTextAndImage() {
        setUpExitButton()
        setUpProgressView()
        setUpProgressLabel()
        setUpTaskView()
        setUpView()
        setUpButtonsStackView()
    }

    private func setUpExitButton() {
        addSubview(exitButton)
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
        progressView.progressTintColor = .myCyan
        progressView.trackTintColor = .myCyanOp
        progressView.snp.makeConstraints { make in
            make.top.equalTo(exitButton.snp_bottomMargin).offset(24)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        progressView.setProgress(0.3, animated: true)
    }

    private func setUpProgressLabel() {
        addSubview(progressLabel)
        progressLabel.text = "Прогресс уровня"
        progressLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        progressLabel.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp_bottomMargin).offset(8)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
    }

    private func setUpTaskView() {
        addSubview(taskView ?? UIView())
        taskView?.backgroundColor = .clear
        taskView?.layer.cornerRadius = 10
        taskView?.layer.masksToBounds = true
        taskView?.snp.makeConstraints { make in
            make.top.equalTo(progressLabel.snp_bottomMargin).offset(40)
            make.height.equalTo(120)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }

    private func setUpButtonsStackView() {
        addSubview(buttonsStackView ?? UIView())
        buttonsStackView?.snp.makeConstraints { make in
            make.top.equalTo(customView.snp_bottomMargin).offset(90)
            make.height.equalTo(160)
            make.width.equalTo(340)
            make.centerX.equalToSuperview()
        }
    }

    private func setUpView() {
        let builder = CustomViewBuilder()
        customView = builder
            .addImage(.start)
            .addBackgroundColor(.white)
            .build()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        customView.addGestureRecognizer(tapGesture)
        addSubview(customView)
        customView.snp.makeConstraints { make in
            make.top.equalTo(taskView!.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
    }

    @objc func viewTapped() {
        startStopButtonTapped?()
    }
}
