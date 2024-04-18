//
//  ProfileScreenFlowCoordinator.swift
//  Solfeggio
//
//  Created by Давид Васильев on 15.04.2024.
//

import Swinject
import UIKit

class ProfileScreenFlowCoordinator: CoordinatorProtocol {

    var navigationController: UINavigationController
    let container: Container

    init(navigationController: UINavigationController, container: Container) {
        self.navigationController = navigationController
        self.container = container
    }

    func start() {
        guard let viewModel = container.resolve(ProfileScreenViewModelProtocol.self) else { return }
        let image: UIImage = .profile
        let viewController = ProfileScreenViewController(viewModel: viewModel as? ProfileScreenViewModel ?? ProfileScreenViewModel())
        let item = UITabBarItem(title: nil, image: image.resizeImage(to: CGSize(width: 34, height: 34)), selectedImage: nil)
        viewController.tabBarItem = item
        navigationController = UINavigationController(rootViewController: viewController)
    }
}
