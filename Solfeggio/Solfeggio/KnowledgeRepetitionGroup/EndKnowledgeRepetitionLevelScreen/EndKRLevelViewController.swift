//
//  EndKnowledgeRepetitionLevelScreenViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 19.05.2024.
//

import UIKit

class EndKRLevelViewController: UIViewController {

    private let contentView: EndKRLevelView
    private let viewModel: EndKRLevelViewModelProtocol
    var exitClosure: ((String) -> Void)?

    init(viewModel: EndKRLevelViewModelProtocol) {
        self.viewModel = viewModel
        self.contentView = EndKRLevelView(frame: CGRect(), resultTuple: viewModel.getResult())
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
