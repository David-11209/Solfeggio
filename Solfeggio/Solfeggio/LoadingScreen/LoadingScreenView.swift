//
//  LoadingScreenView.swift
//  Solfeggio
//
//  Created by Давид Васильев on 06.05.2024.
//

import UIKit
import JGProgressHUD
import SnapKit

class LoadingScreenView: UIView {

    private lazy var hud = JGProgressHUD()
    private lazy var imageView: UIImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        self.backgroundColor = .pBlue
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    } 

    private func setUp() {
        setUpProgressHUD()
        setUpImageView()
    }

    private func setUpProgressHUD() {
        hud.indicatorView = JGProgressHUDPieIndicatorView()
        hud.indicatorView = JGProgressHUDIndeterminateIndicatorView()
        hud.textLabel.text = "Загрузка"
        hud.detailTextLabel.text = "0%"
        hud.show(in: self)
        var progress: Float = 0.0
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            progress += 0.1
            self.hud.setProgress(progress, animated: true)
            let value: Float = progress / 1.0
            self.hud.detailTextLabel.text = "\(Int(value * 100.0))%"
            if progress > 1.0 {
                timer.invalidate()
                self.hud.indicatorView = JGProgressHUDSuccessIndicatorView()
                self.hud.detailTextLabel.text = nil
                self.hud.textLabel.text = "Готово!"
                self.hud.dismiss(afterDelay: 3)
            }
        }
    }

    private func setUpImageView() {
        addSubview(imageView)
        imageView.image = .sleep
        imageView.contentMode = .scaleAspectFill
        imageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(90)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(240)
        }
    }
}
