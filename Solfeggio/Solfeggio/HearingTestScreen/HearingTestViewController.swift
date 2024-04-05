//
//  HearingTestViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 04.04.2024.
//

import UIKit

class HearingTestViewController: UIViewController {
    private let contentView: HearingTestScreenView = .init()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        view = contentView
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
