//
//  KnowledgeRepetitionScreenViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 14.04.2024.
//

import UIKit

class KnowledgeRepetitionScreenViewController: UIViewController {

    private let contentView: KnowledgeRepetitionScreenView = .init()
    private let viewModel: KnowledgeRepetitionScreenViewModel

    init(viewModel: KnowledgeRepetitionScreenViewModel) {
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
