//
//  KnowledgeRepetitionLevelViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 28.03.2024.
//

import UIKit

class KnowledgeRepetitionLevelViewController: UIViewController {

    let text = "Выберите правильную длительность ноты"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Ноты и длительности"
    }

    override func loadView() {
        view = KnowledgeRepetitionLevelView(
            frame: CGRect(),
            text: text,
            image: .note,
            buttonsNames: ["Четверть", "Шеснадцатая", "Половинная", "Восьмая"]
        )
        view.backgroundColor = .white
    }
}
