//
//  KnowledgeRepetitionScreenViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 14.04.2024.
//

import UIKit

class KnowledgeRepetitionScreenViewController: UIViewController {

    private let contentView: KnowledgeRepetitionScreenView = .init()
    private let viewModel: KnowledgeRepetitionSViewModelProtocol
    var chooseViewTappedClosure: (([String]) -> Void)?
    var startTappedClosure: (() -> Void)?

    init(viewModel: KnowledgeRepetitionSViewModelProtocol) {
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
        contentView.chooseViewTappedClosure = {
            self.chooseViewTappedClosure?(self.viewModel.getNames())
        }
        contentView.startTappedClosure = { segment in
            self.viewModel.setSelectedNumberTasks(number: segment)
            self.startTappedClosure?()
        }
    }
}
