import SnapKit
import UIKit

class GradientView: UIView {

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    init(frame: CGRect, color1: UIColor, color2: UIColor) {
        super.init(frame: frame)
        setUpGradient(color1: color1, color2: color2)
        setConstraints(frame: frame)
    }

    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        setUpOneColor(color: color)
        setConstraints(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setUpGradient(color1: UIColor, color2: UIColor) {
        guard let gradientLayer = self.layer as? CAGradientLayer else { return }
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
    }

    func setUpOneColor(color: UIColor) {
        self.backgroundColor = color
    }

    func setConstraints(frame: CGRect) {
        self.snp.makeConstraints { make in
            make.width.equalTo(frame.width)
            make.height.equalTo(frame.height)
        }
    }
}
