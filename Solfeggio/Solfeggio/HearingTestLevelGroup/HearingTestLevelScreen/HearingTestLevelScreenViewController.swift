//
//  HearingTestLevelScreenViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 28.03.2024.
//

import UIKit

class HearingTestLevelScreenViewController: UIViewController {

    let text = "Выберите ноту которую вы услышали"

    private var contentView: HearingTestLevelScreenView?
    private var viewModel: HearingTestLevelScreenViewModelProtocol

    var didSelectItem: ((_ indexPath: IndexPath) -> Void)?
    var exitClosure: (() -> Void)?

    init(viewModel: HearingTestLevelScreenViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.navigationItem.title = "Ноты и длительности"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        contentView = HearingTestLevelScreenView(
            frame: CGRect(),
            text: text,
            image: .note,
            buttonsNames: ["до", "ре", "ми", "фа"]
        )

        view = contentView
        view.backgroundColor = .pBlue
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView?.startStopButtonTapped = {
            self.viewModel.playSound()
        }
        contentView?.exitClosure = {
            self.exitClosure?()
        }
    }
}
