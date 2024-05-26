//
//  ProfileScreenViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 14.04.2024.
//

import UIKit

class ProfileScreenViewController: UIViewController {

    private var contentView: ProfileScreenView
    private let viewModel: ProfileScreenViewModelProtocol

    init(viewModel: ProfileScreenViewModelProtocol) {
        guard let user = viewModel.getUser() else {
            fatalError("User is not authorized")
        }
        var image = UIImage()
        if user.image == "1" {
            image = .avatar
        } else {
            image = .avatar2
        }
        contentView = ProfileScreenView(frame: CGRect(), avatar: image, name: user.name)

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
        
    }
}
