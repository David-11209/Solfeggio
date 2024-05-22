//
//  MissingInternetView.swift
//  Solfeggio
//
//  Created by Давид Васильев on 22.05.2024.
//

import JGProgressHUD
import SnapKit
import UIKit

class MissingInternetView: UIView {

    private lazy var hud = JGProgressHUD()
    private lazy var imageView: UIImageView = UIImageView()
    var exitClosure: (() -> Void)?
    var isConnect = false

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
        hud.indicatorView = JGProgressHUDIndeterminateIndicatorView()
        hud.textLabel.text = "Попытка подключения к интернету"
        hud.show(in: self)
        var time: Float = 0.0
        self.hud.textLabel.lineBreakMode = .byWordWrapping
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            time += 0.1
            if self.isConnect {
                timer.invalidate()
                self.exitClosure?()
            } else if time > 10 {

                timer.invalidate()
                self.hud.textLabel.text = "Отсутсвует соединение.\nПереподключение к интернету..."

                self.hud.indicatorView = JGProgressHUDImageIndicatorView(image: .noWifi2.resizeImage(to: CGSize(width: 40, height: 40)) ?? UIImage())
            }
        }
    }

    private func setUpImageView() {
        addSubview(imageView)
        imageView.image = .noWifi
        imageView.contentMode = .scaleAspectFill
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(140)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(240)
        }
    }
}
