//
//  MissingInternetViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 22.05.2024.
//

import UIKit

class MissingInternetViewController: UIViewController {

    private let contentView: MissingInternetView = .init()
    private var viewModel: MissingInternetViewModelProtocol
    var exitClosure: (() -> Void)?
    init(viewModel: MissingInternetViewModelProtocol) {
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

        viewModel.connectClosure = {
            self.exitClosure?()
        }
        viewModel.checkConnection()
    }
}
