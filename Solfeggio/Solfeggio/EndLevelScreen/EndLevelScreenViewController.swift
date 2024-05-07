//
//  EndLevelScreenViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 06.05.2024.
//

import UIKit

class EndLevelScreenViewController: UIViewController {

    private let contentView: EndLevelScreenView = .init()
    private let viewModel: EndLevelScreenViewModelProtocol

    init(viewModel: EndLevelScreenViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }
}
