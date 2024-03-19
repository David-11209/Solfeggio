import SnapKit
import UIKit

class GradientTaskView: UIView {

    private lazy var label = UILabel(frame: bounds)

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    init(frame: CGRect, text: String, color1: UIColor, color2: UIColor) {
        super.init(frame: frame)
        setUpGradient(color1: color1, color2: color2)
        setUpLabel(text: text)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setUpGradient(color1: UIColor, color2: UIColor) {
        guard let gradientLayer = self.layer as? CAGradientLayer else { return }
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
    }

    private func setUpLabel(text: String) {
        addSubview(label)
        label.text = text
        label.textAlignment = .center
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 28.0)
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(2)
        }
    }
}
