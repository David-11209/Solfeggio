import UIKit
import SnapKit

class LessonLevelView: UIView {

    private lazy var exitButton: UIButton = UIButton()
    private lazy var hpImage1: UIImageView = UIImageView()
    private lazy var hpImage2: UIImageView = UIImageView()
    private lazy var hpImage3: UIImageView = UIImageView()
    private lazy var hpStackView: UIStackView = UIStackView()
    private lazy var progressView: UIProgressView = UIProgressView(progressViewStyle: .default)
    private lazy var progressLabel: UILabel = UILabel()
    private var taskView: GradientTaskView?
    private lazy var taskLabel: UILabel = UILabel()
    private var customView: UIView = UIView()
    private var buttonsStackView: ButtonsStackView?
    var didSelectAnswer: ((_ answer: String) -> Void)?
    var exitClosure: (() -> Void)?

    init(frame: CGRect, text: String, image: UIImage, buttonsNames: [String], progressAnimate: Bool) {
        super.init(frame: frame)
        let builder = CustomViewBuilder()
        taskView = GradientTaskView(frame: frame, text: text, color1: .myMagentaOp, color2: .myPurpleOp)
        customView = builder
            .addImage(image)
            .addBackgroundColor(.white)
            .build()
        buttonsStackView = ButtonsStackView(names: buttonsNames, color: .pPurple)
        progressView.setProgress(0.01, animated: progressAnimate)
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
        setUpHpStackView()
        setUpHpImage()
        setUpProgressView()
        setUpProgressLabel()
        setUpTaskView()
        setUpButtonsStackView()
    }

    private func setUpWithTextAndImage() {
        setUpExitButton()
        setUpHpStackView()
        setUpHpImage()
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

    private func setUpHpStackView() {
        addSubview(hpStackView)
        hpStackView.addArrangedSubview(hpImage1)
        hpStackView.addArrangedSubview(hpImage2)
        hpStackView.addArrangedSubview(hpImage3)
        hpStackView.axis = .horizontal
        hpStackView.alignment = .fill
        hpStackView.distribution = .fillEqually
        hpStackView.spacing = 16
        hpStackView.snp.makeConstraints {make in
            make.top.equalToSuperview().offset(66)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(30)
            make.width.equalTo(120)
        }
    }

    private func setUpHpImage() {
        hpImage1.image = .hp
        hpImage2.image = .hp
        hpImage3.image = .hp
    }

    private func setUpProgressView() {
        addSubview(progressView)
        progressView.layer.cornerRadius = 10
        progressView.layer.masksToBounds = true
        progressView.progressTintColor = .pPurple
        progressView.trackTintColor = .pPurpleOp
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
        addSubview(customView)
        customView.snp.makeConstraints { make in
            make.top.equalTo(taskView?.snp.bottom ?? UIView()).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
    }
}
