//
//  LoadingScreenViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 06.05.2024.
//

import UIKit

class LoadingScreenViewController: UIViewController {

    private let contentView: LoadingScreenView = .init()
    private var viewModel: LoadingScreenViewModelProtocol
    var allDataDownload: (([String: UIImage]) -> Void)?

    init(viewModel: LoadingScreenViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.allDataDownload = { dict in
            self.allDataDownload?(dict)
        }
    }
}
