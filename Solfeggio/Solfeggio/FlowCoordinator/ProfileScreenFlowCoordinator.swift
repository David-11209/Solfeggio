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
    var authorized: Bool = UserDefaults.standard.object(forKey: "authorized") as? Bool ?? false

    init(navigationController: UINavigationController, container: Container) {
        self.navigationController = navigationController
        self.container = container
    }

    func start() {
        if authorized {
            showProfileScreen()
        } else {
            showSignInScreen()
        }
    }

    func showProfileScreen() {
        guard let viewModel = container.resolve(ProfileScreenViewModelProtocol.self) else { return }
        let viewController = ProfileScreenViewController(viewModel: viewModel)
        navigationController = UINavigationController(rootViewController: viewController)
        let image: UIImage = .profile
        let item = UITabBarItem(title: nil, image: image.resizeImage(to: CGSize(width: 34, height: 34)), selectedImage: nil)
        viewController.tabBarItem = item
//        UserDefaults.standard.set(true, forKey: "authorized")
    }

    func showSignInScreen() {
        let viewController = SignInViewController()
        navigationController = UINavigationController(rootViewController: viewController)
        let image: UIImage = .profile
        let item = UITabBarItem(title: nil, image: image.resizeImage(to: CGSize(width: 34, height: 34)), selectedImage: nil)
        viewController.tabBarItem = item
        viewController.exitClosure = { option in
            if option == "register" {
                self.showRegistrationScreen()
            }
        }
    }

    func showRegistrationScreen() {
        let viewController = RegistrationViewController()
        navigationController.pushViewController(
            viewController,
            animated: true
        )
    }
//    func start() {
//        let viewController = SignInViewController()
//        navigationController = UINavigationController(rootViewController: viewController)
//    }
}
