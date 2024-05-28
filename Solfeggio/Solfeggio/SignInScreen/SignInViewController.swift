//
//  SignInViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 24.05.2024.
//

import UIKit

class SignInViewController: UIViewController {

    private let contentView: SignInView

    var exitClosure: ((String) -> Void)?

    init() {
        self.contentView = SignInView()
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
