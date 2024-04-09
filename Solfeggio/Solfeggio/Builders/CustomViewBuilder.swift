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
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 22.0)
        return self
    }

    func addMainLabel(_ title: String) -> Self {
        mainLabel = UILabel()
        mainLabel?.text = title
        mainLabel?.textAlignment = .center
        mainLabel?.textColor = .black
        mainLabel?.minimumScaleFactor = 0.5
        mainLabel?.adjustsFontSizeToFitWidth = true
        mainLabel?.font = UIFont.systemFont(ofSize: 130.0, weight: .heavy)
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

    func build() -> UIView {
        if !gradientColors.isEmpty {
            view = GradientView(frame: CGRect(), color1: gradientColors[0], color2: gradientColors[1])
        } else {
            view = GradientView(frame: CGRect(), color: backgroundColor ?? UIColor())
        }
        if let label = titleLabel, let imageView = imageView {
            view?.addSubview(imageView)
            setUpImage(20, 20, 70)
            view?.addSubview(label)
            setUpTitleLabel()
        } else if let label = titleLabel, let mainLabel = mainLabel {
            view?.addSubview(mainLabel)
            setUpMainLabel()
            view?.addSubview(label)
            setUpTitleLabel()
        } else if let imageView = imageView {
            view?.addSubview(imageView)
            setUpImage(40, 60, 40)
        }
        setUpShadow()
        return view ?? UIView()
    }

    private func setUpImage(_ top: Int, _ side: Int, _ bottom: Int) {
        imageView?.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(top)
            make.leading.equalToSuperview().offset(side)
            make.trailing.equalToSuperview().inset(side)
            make.bottom.equalToSuperview().inset(bottom)
        }
    }

    private func setUpTitleLabel() {
        titleLabel?.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(26)
        }
    }

    private func setUpMainLabel() {
        mainLabel?.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(60)
        }
    }

    private func setUpImageWithText() {
        imageView?.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.leading.equalToSuperview().offset(80)
            make.trailing.equalToSuperview().inset(80)
            make.bottom.equalToSuperview().inset(80)
        }
    }

    private func setUpButton() {
        button?.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(60)
            make.bottom.equalToSuperview().inset(40)
        }
    }

    private func setUpShadow() {
        view?.layer.cornerRadius = 30
        view?.layer.masksToBounds = false
        view?.layer.shadowColor = UIColor.black.cgColor
        view?.layer.shadowOpacity = 0.5
        view?.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        view?.layer.shadowRadius = 5.0
        view?.layer.borderColor = UIColor.black.cgColor
    }
}

