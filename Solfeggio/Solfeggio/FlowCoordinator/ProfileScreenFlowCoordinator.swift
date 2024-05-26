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
        let image: UIImage = .profile
        let item = UITabBarItem(title: nil, image: image.resizeImage(to: CGSize(width: 34, height: 34)), selectedImage: nil)
        item.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 10)
        viewController.tabBarItem = item
        navigationController.setViewControllers([viewController], animated: true)
    }

    func showSignInScreen() {
        let viewController = SignInViewController()
        navigationController = UINavigationController(rootViewController: viewController)
        let image: UIImage = .profile
        let item = UITabBarItem(title: nil, image: image.resizeImage(to: CGSize(width: 34, height: 34)), selectedImage: nil)
        viewController.tabBarItem = item
        viewController.exitClosure = { option in
            self.navigationController.isNavigationBarHidden = true
            if option == "register" {
                self.showRegistrationScreen()
            } else if option == "authorize" {
                self.showAuthorizationScreen()
            }
        }
    }

    func showRegistrationScreen() {
        guard let viewModel = container.resolve(RegistrationViewModelProtocol.self) else { return }
        let viewController = RegistrationViewController(viewModel: viewModel)
        viewController.registerClosure = {
            var result = viewModel.getRegistrationInfo()
        }
        viewController.showProfileScreen = {
            self.showProfileScreen()
        }
        viewController.exitClosure = {
            self.navigationController.popViewController(animated: true)
        }
        navigationController.pushViewController(
            viewController,
            animated: true
        )
    }

    func showAuthorizationScreen() {
        guard let viewModel = container.resolve(AuthorizationViewModelProtocol.self) else { return }
        let viewController = AuthorizationViewController(viewModel: viewModel)
        viewController.authorizeClosure = {
            var result = viewModel.getAuthorizationInfo()
        }
        viewController.exitClosure = {
            self.navigationController.popViewController(animated: true)
        }
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
