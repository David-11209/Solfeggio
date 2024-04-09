//
//  MainScreenSubCollectionViewCell.swift
//  Solfeggio
//
//  Created by Давид Васильев on 08.04.2024.
//

import UIKit

class MainScreenSubCollectionViewCell: UICollectionViewCell {

    private var customView: GradientView = GradientView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        self.backgroundColor = .red
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(colors: [UIColor]) {
        customView.setUpGradient(color1: colors[0], color2: colors[1])

    }

    private func setUp() {
        contentView.addSubview(customView)
        customView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().inset(5)
            make.trailing.equalToSuperview().inset(5)
        }
    }
}
