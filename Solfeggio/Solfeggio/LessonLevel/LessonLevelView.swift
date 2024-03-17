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
    private var taskView: CustomView?
    private lazy var taskLabel: UILabel = UILabel()
    private var customView: UIView = UIView()
    private var buttonsStackView: ButtonsStackView?

    /// init для уровня с текстовым заданием
    init(frame: CGRect, text: String, buttonsNames: [String]) {
        super.init(frame: frame)
        taskView = CustomView(frame: frame, text: text, color1: .myMagentaOp, color2: .myPurpleOp)
        buttonsStackView = ButtonsStackView(names: buttonsNames, color: .myPinkOp)
        setUpWithText()
    }

    /// init для уровня с текстовым заданием и картинкой
    init(frame: CGRect, text: String, image: UIImage, buttonsNames: [String]) {
        super.init(frame: frame)
        taskView = CustomView(frame: frame, text: text, color1: .myMagentaOp, color2: .myPurpleOp)
        buttonsStackView = ButtonsStackView(names: buttonsNames, color: .myPinkOp)
        setUpWithTextAndImage()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpWithText() {
        setUpExitButton()
        setUpHpStackView()
        setUpHpImage()
        setUpProgressView()
        setUpProgressLabel()
        setUpTaskView()
        setUpButtonsStackView()
    }

    func setUpWithTextAndImage() {
        setUpExitButton()
        setUpHpStackView()
        setUpHpImage()
        setUpProgressView()
        setUpProgressLabel()
        setUpTaskView()
        setUpView()
        setUpButtonsStackView()
    }

    func setUpExitButton() {
        addSubview(exitButton)
        exitButton.setImage(.exit, for: .normal)
        exitButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.leading.equalToSuperview().offset(22)
            make.height.equalTo(36)
            make.width.equalTo(36)
        }
    }

    func setUpHpStackView() {
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

    func setUpHpImage() {
        hpImage1.image = .hp
        hpImage2.image = .hp
        hpImage3.image = .hp
    }

    func setUpProgressView() {
        addSubview(progressView)
        progressView.layer.cornerRadius = 10
        progressView.layer.masksToBounds = true
        progressView.progressTintColor = .magenta
        progressView.trackTintColor = .myMagentaOp
        progressView.snp.makeConstraints { make in
            make.top.equalTo(exitButton.snp_bottomMargin).offset(24)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        progressView.setProgress(0.3, animated: true)
    }

    func setUpProgressLabel() {
        addSubview(progressLabel)
        progressLabel.text = "Прогресс уровня"
        progressLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        progressLabel.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp_bottomMargin).offset(8)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
    }

    func setUpTaskView() {
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

    func setUpButtonsStackView() {
        addSubview(buttonsStackView ?? UIView())
        buttonsStackView?.snp.makeConstraints { make in
            make.top.equalTo(customView.snp_bottomMargin).offset(90)
            make.height.equalTo(160)
            make.width.equalTo(340)
            make.centerX.equalToSuperview()
        }
    }

    func setUpView() {
        let builder = CustomViewBuilder()
        customView = builder
            .addImage(.note)
            .addBackgroundColor(.white)
            .build()
        addSubview(customView)
        customView.snp.makeConstraints { make in
            make.top.equalTo(taskView!.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
    }
}
