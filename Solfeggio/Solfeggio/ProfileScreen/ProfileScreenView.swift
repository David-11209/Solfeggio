//
//  ProfileScreenView.swift
//  Solfeggio
//
//  Created by Давид Васильев on 15.04.2024.
//

import SnapKit
import UIKit

class ProfileScreenView: UIView {

    private lazy var titleLabel: UILabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        self.backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        setUpTitleLabel()
    }

    private func setUpTitleLabel() {
        addSubview(titleLabel)
        titleLabel.text = "Экран профиля"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 36.0)
        titleLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(40)
        }
    }
}
