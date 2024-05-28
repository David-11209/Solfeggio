//
//  TheoryViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 28.05.2024.
//

import UIKit

class TheoryViewController: UIViewController {

    private let contentView: TheoryView
    private let viewModel: TheoryViewModelProtocol

    var exitClosure: (() -> Void)?

    init(viewModel: TheoryViewModelProtocol) {
        self.contentView = TheoryView()
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let tuple = viewModel.getData()
        contentView.config(text: tuple.0, image: tuple.1)
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.exitClosure = {
            self.exitClosure?()
        }
    }
}
