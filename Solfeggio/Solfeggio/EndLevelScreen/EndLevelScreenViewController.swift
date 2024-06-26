//
//  EndLevelScreenViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 06.05.2024.
//

import UIKit

class EndLevelScreenViewController: UIViewController {

    private let contentView: EndLevelScreenView
    private let viewModel: EndLevelScreenViewModelProtocol
    var exitClosure: ((String) -> Void)?

    init(viewModel: EndLevelScreenViewModelProtocol) {
        self.viewModel = viewModel
        self.contentView = EndLevelScreenView(frame: CGRect(), result: viewModel.getResult())
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
        contentView.exitClosure = { result in
            self.exitClosure?(result)
        }
    }
}
