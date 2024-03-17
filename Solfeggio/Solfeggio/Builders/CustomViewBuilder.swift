import SnapKit
import UIKit

class CustomViewBuilder {

    private var view: GradientView?
    private var title: String?
    private var backgroundColor: UIColor?
    private var imageView: UIImageView?
    private var button: UIButton?
    private var mainLabel: UILabel?
    private var titleLabel: UILabel?
    private var gradientColors: [UIColor] = []

    func addTitle(_ title: String) -> Self {
        titleLabel = UILabel()
        titleLabel?.text = title
        titleLabel?.textAlignment = .center
        titleLabel?.textColor = .black
        titleLabel?.minimumScaleFactor = 0.5
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 28.0)
        return self
    }

    func addMainLabel(_ title: String) -> Self {
        mainLabel = UILabel()
        mainLabel?.text = title
        mainLabel?.textAlignment = .center
        mainLabel?.textColor = .black
        mainLabel?.minimumScaleFactor = 0.5
        mainLabel?.adjustsFontSizeToFitWidth = true
        mainLabel?.font = UIFont.boldSystemFont(ofSize: 100.0)
        return self
    }

    func addBackgroundColor(_ color: UIColor) -> Self {
        backgroundColor = color
        return self
    }

    func addImage(_ image: UIImage) -> Self {
        imageView = UIImageView(image: image)
        imageView?.contentMode = .scaleAspectFit
        imageView?.clipsToBounds = true
        return self
    }

    func setGradientColors(_ colors: [UIColor]) -> Self {
        self.gradientColors = colors
        return self
    }

    func addButton(_ image: UIImage) -> Self {
        button = UIButton()
        button?.setImage(image, for: .normal)
        button?.imageView?.contentMode = .scaleAspectFit
        button?.contentMode = .scaleAspectFill
        button?.imageView?.clipsToBounds = true
        return self
    }

    func build() -> UIView {
        let frame = CGRect(x: 50, y: 100, width: 200, height: 200)
        if !gradientColors.isEmpty {

            view = GradientView(frame: frame, color1: gradientColors[0], color2: gradientColors[1])
        } else {
            view = GradientView(frame: frame, color: backgroundColor ?? UIColor())
        }
        if let button = button {
            view?.addSubview(button)
        }
        /// to do вариация с кнопкой и с лейблом картинкой и лейблом вместе
        if let label = titleLabel, let imageView = imageView {
            view?.addSubview(imageView)
            setUpImage(30, 20, 80)
            view?.addSubview(label)
            setUpTitleLabel()
        } else if let label = titleLabel, let mainLabel = mainLabel {
            view?.addSubview(mainLabel)
            setUpMainLabel()
            view?.addSubview(label)
            setUpTitleLabel()
        } else if let button = button {
            view?.addSubview(button)
            setUpButton()
        } else if let imageView = imageView {
            view?.addSubview(imageView)
            setUpImage(40, 60, 40)
        }
        setUpShadow()

        return view!
    }

    func setUpImage(_ top: Int, _ side: Int, _ bottom: Int) {

        imageView?.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(top)
            make.leading.equalToSuperview().offset(side)
            make.trailing.equalToSuperview().inset(side)
            make.bottom.equalToSuperview().inset(bottom)
        }
    }

    func setUpTitleLabel() {
        titleLabel?.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(26)
        }
    }

    func setUpMainLabel() {
        mainLabel?.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(80)
        }
    }

    func setUpImageWithText() {
        imageView?.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.leading.equalToSuperview().offset(80)
            make.trailing.equalToSuperview().inset(80)
            make.bottom.equalToSuperview().inset(80)
        }
    }

    func setUpButton() {
        button?.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(80)
        }
    }

    func setUpShadow() {
        view?.layer.cornerRadius = 40
        view?.layer.masksToBounds = false
        view?.layer.shadowColor = UIColor.black.cgColor
        view?.layer.shadowOpacity = 0.5
        view?.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        view?.layer.shadowRadius = 5.0
        view?.layer.borderColor = UIColor.black.cgColor
    }
}
