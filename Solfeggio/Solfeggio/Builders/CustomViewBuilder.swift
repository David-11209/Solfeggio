import SnapKit
import UIKit

protocol CustomViewBuilderProtocol {
    func  addTitle(_ title: String) -> Self
    func addMainLabel(_ title: String) -> Self
    func addBackgroundColor(_ color: UIColor) -> Self
    func setGradientColors(_ colors: [UIColor]) -> Self
    func addImage(_ image: UIImage) -> Self
    func build() -> UIView
}

class CustomViewBuilder: CustomViewBuilderProtocol {

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
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 24.0)
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
            view = GradientView()
            view?.setUpGradient(color1: gradientColors[0], color2: gradientColors[1])
        } else {
            view = GradientView()
            view?.setUpOneColor(color: backgroundColor ?? UIColor())
        }
        if let label = titleLabel, let mainLabel = mainLabel, let imageView = imageView {
            print("зашел")
            view?.addSubview(imageView)
            setUpImage(20, 10, 80, 40)
            view?.addSubview(mainLabel)
            setUpMainLabel(36, 90, 10, 60)
            view?.addSubview(label)
            setUpTitleLabel(10, 10, 26)

        } else if let label = titleLabel, let imageView = imageView {
            view?.addSubview(imageView)
            setUpImage(20, 20, 20, 70)
            view?.addSubview(label)
            setUpTitleLabel(10, 10, 26)
        } else if let label = titleLabel, let mainLabel = mainLabel {
            view?.addSubview(mainLabel)
            setUpMainLabel(10, 20, 20, 60)
            view?.addSubview(label)
            setUpTitleLabel(10, 10, 26)
        } else if let imageView = imageView {
            view?.addSubview(imageView)
            setUpImage(40, 60, 60, 40)
        }
//        else {
//
//        }
        setUpShadow(30)
        return view ?? UIView()
    }

    private func setUpImage(_ top: Int, _ sideL: Int, _ sideR: Int, _ bottom: Int) {
        imageView?.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(top)
            make.leading.equalToSuperview().offset(sideL)
            make.trailing.equalToSuperview().inset(sideR)
            make.bottom.equalToSuperview().inset(bottom)
        }
    }

    private func setUpTitleLabel(_ sideL: Int, _ sideR: Int, _ bottom: Int) {
        titleLabel?.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(sideL)
            make.trailing.equalToSuperview().inset(sideR)
            make.bottom.equalToSuperview().inset(bottom)
        }
    }

    private func setUpMainLabel(_ top: Int, _ sideL: Int, _ sideR: Int, _ bottom: Int) {
        mainLabel?.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(top)
            make.leading.equalToSuperview().offset(sideL)
            make.trailing.equalToSuperview().inset(sideR)
            make.bottom.equalToSuperview().inset(bottom)
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

    private func setUpShadow(_ radius: CGFloat) {
        view?.layer.cornerRadius = radius
        view?.layer.masksToBounds = false
        view?.layer.shadowColor = UIColor.black.cgColor
        view?.layer.shadowOpacity = 0.5
        view?.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        view?.layer.shadowRadius = 5.0
        view?.layer.borderColor = UIColor.black.cgColor
    }
}

