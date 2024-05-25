//
//  RegistrationViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 25.05.2024.
//

import UIKit

class RegistrationViewController: UIViewController {

    private let contentView: RegistrationView

    var exitClosure: ((String) -> Void)?

    init() {
        self.contentView = RegistrationView()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
}
