//
//  ProfileScreenViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 14.04.2024.
//

import UIKit

class ProfileScreenViewController: UIViewController {

    private let contentView: ProfileScreenView = .init()
    private let viewModel: ProfileScreenViewModel

    init(viewModel: ProfileScreenViewModel) {
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
