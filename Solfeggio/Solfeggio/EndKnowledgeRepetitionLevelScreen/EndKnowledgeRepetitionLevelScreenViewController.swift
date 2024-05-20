//
//  EndKnowledgeRepetitionLevelScreenViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 19.05.2024.
//

import UIKit

class EndKnowledgeRepetitionLevelScreenViewController: UIViewController {

    private let contentView: EndKnowledgeRepetitionLevelScreenView
    private let viewModel: EndKnowledgeRepetitionLevelScreenViewModelProtocol
    var exitClosure: ((String) -> Void)?

    init(viewModel: EndKnowledgeRepetitionLevelScreenViewModelProtocol) {
        self.viewModel = viewModel
        self.contentView = EndKnowledgeRepetitionLevelScreenView(frame: CGRect(), result: viewModel.getResult())
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
