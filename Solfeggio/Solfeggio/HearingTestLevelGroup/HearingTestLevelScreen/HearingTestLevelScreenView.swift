//
//  HearingTestLevelScreenView.swift
//  Solfeggio
//
//  Created by Давид Васильев on 28.03.2024.
//

import SnapKit
import UIKit

class HearingTestLevelScreenView: UIView {

    private lazy var exitButton: UIButton = UIButton()
    private lazy var progressView: UIProgressView = UIProgressView(progressViewStyle: .default)
    private lazy var progressLabel: UILabel = UILabel()
    private var taskView: GradientTaskView?
    private lazy var taskLabel: UILabel = UILabel()
    private var customView: UIView = UIView()
    private var resultView: UIView = UIView()
    private var resultTitle: UILabel = UILabel()
    private var resultImageView: UIImageView = UIImageView()
    var buttonsStackView: ButtonsStackView?
    var didSelectAnswer: ((_ answer: String) -> Void)?
    var startStopButtonTapped: (() -> Void)?
    var exitClosure: (() -> Void)?

    init(frame: CGRect, text: String, buttonsNames: [String], progressProcent: Float, progressAnimate: Bool) {
        super.init(frame: frame)
        taskView = GradientTaskView(frame: frame, text: text, color1: .pOrange, color2: .pRed)
        buttonsStackView = ButtonsStackView(names: buttonsNames, color: .pOrange)
        progressView.setProgress(progressProcent, animated: progressAnimate)
        setUpWithText()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpWithText() {
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
        let action: UIAction = UIAction { [weak self] _ in
            self?.exitClosure?()
        }
        exitButton.addAction(action, for: .touchUpInside)
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
        progressView.progressTintColor = .pOrange
        progressView.trackTintColor = .pOrangeOp
        progressView.snp.makeConstraints { make in
            make.top.equalTo(exitButton.snp_bottomMargin).offset(24)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
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
        buttonsStackView?.actionClosure = { answer in
            self.didSelectAnswer?(answer)
        }
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
            make.top.equalTo(taskView?.snp.bottom ?? UIView()).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
    }

    @objc func viewTapped() {
        startStopButtonTapped?()
    }

    func setupResultView(color: UIColor) {
        addSubview(resultView)
        resultView.backgroundColor = color
        resultView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(300)
            make.height.equalTo(300)
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }

    func setUpResultImage(image: UIImage) {
        resultView.addSubview(resultImageView)
        resultImageView.contentMode = .scaleAspectFill
        resultImageView.image = image
        resultImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.height.width.equalTo(46)
            make.leading.equalToSuperview().offset(20)
        }
    }

    func setUpResultTitle(title: String) {
        resultView.addSubview(resultTitle)
        resultTitle.text = title
        resultTitle.font = .boldSystemFont(ofSize: 34)
        resultTitle.textColor = .white
        resultTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.leading.equalToSuperview().offset(80)
        }
    }

    func showView(result: Bool) {
        if result {
            setupResultView(color: .myGreen)
            setUpResultImage(image: .ok)
            setUpResultTitle(title: "Правильно")
        } else {
            setupResultView(color: .pRed)
            setUpResultImage(image: .cross)
            setUpResultTitle(title: "Неправильно")
        }
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut, animations: {
            self.resultView.transform = CGAffineTransform(translationX: 0, y: -280)
        })
    }
}
