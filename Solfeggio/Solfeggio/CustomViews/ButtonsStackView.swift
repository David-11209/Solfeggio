import SnapKit
import UIKit

class ButtonsStackView: UIView {

    private lazy var button1 = UIButton()
    private lazy var button2 = UIButton()
    private lazy var button3 = UIButton()
    private lazy var button4 = UIButton()
    private lazy var stackView1 = UIStackView()
    private lazy var stackView2 = UIStackView()
    private lazy var mainStackView = UIStackView()
    private var names: [String] = []

    var actionClosure: ((_ answer: String) -> Void)?

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    init(names: [String], color: UIColor) {
        super.init(frame: .zero)
        self.names = names
        setUpButton(button: button1, name: names[0], color: color)
        setUpButton(button: button2, name: names[1], color: color)
        setUpButton(button: button3, name: names[2], color: color)
        setUpButton(button: button4, name: names[3], color: color)
        setUpSubStackView(stackView1, button1, button2)
        setUpSubStackView(stackView2, button3, button4)
        setUpMainStackView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setUpMainStackView() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(stackView1)
        mainStackView.addArrangedSubview(stackView2)
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fillEqually
        mainStackView.spacing = 26
        mainStackView.snp.makeConstraints {make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    private func setUpSubStackView(_ stackView: UIStackView, _ buttonFirst: UIButton, _ buttonSecond: UIButton) {
        addSubview(stackView)
        stackView.addArrangedSubview(buttonFirst)
        stackView.addArrangedSubview(buttonSecond)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 36
    }

    private func setUpButton(button: UIButton, name: String, color: UIColor) {
        button.setTitle(name, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        button.backgroundColor = color
        button.layer.cornerRadius = 10
        let buttonAction: UIAction = UIAction { _ in
            UIView.animate(withDuration: 0.3, animations: {
                button.alpha = 0.5
            }, completion: { _ in
                UIView.animate(withDuration: 0.3, animations: {
                    button.alpha = 1.0
                })
            })
            DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(500)) {
                DispatchQueue.main.async {
                    self.actionClosure?(name)
                }
            }
        }
        button.addAction(buttonAction, for: .touchUpInside)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        button.layer.shadowRadius = 5.0
        button.layer.borderColor = UIColor.black.cgColor
    }
}
