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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Ноты и длительности"
    }

    override func loadView() {
        contentView = HearingTestLevelScreenView(
            frame: CGRect(),
            text: text,
            image: .note,
            buttonsNames: ["до", "ре", "ми", "фа"]
        )
        contentView?.startStopButtonTapped = {
            print("start")
        }
        view = contentView
        view.backgroundColor = .white
    }
}
