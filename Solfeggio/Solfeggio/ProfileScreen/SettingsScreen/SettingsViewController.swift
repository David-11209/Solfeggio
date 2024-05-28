//
//  SettingsViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 28.05.2024.
//

import UIKit

class SettingsViewController: UIViewController {

    private var viewModel: SettingsViewModelProtocol
    private var contentView: SettingsView
    var exitClosure: ((String) -> Void)?

    init(viewModel: SettingsViewModelProtocol) {
        self.viewModel = viewModel
        contentView = SettingsView()
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
            self.viewModel.logOut()
            self.exitClosure?(result)
        }
    }
}
