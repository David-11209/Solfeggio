//
//  EndLevelScreenView.swift
//  Solfeggio
//
//  Created by Давид Васильев on 06.05.2024.
//

import UIKit

class EndLevelScreenView: UIView {

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
        /// здесь будет setUp элементов для экрана после оканчания уровня
    }
}
