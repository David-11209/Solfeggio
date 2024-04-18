//
//  HearingTestScreenFlowCoordinator.swift
//  Solfeggio
//
//  Created by Давид Васильев on 14.04.2024.
//

import Swinject
import UIKit

class HearingTestScreenFlowCoordinator: CoordinatorProtocol {

    var navigationController: UINavigationController
    let container: Container

    init(navigationController: UINavigationController, container: Container) {
        self.navigationController = navigationController
        self.container = container
    }

    func start() {
        guard let viewModel = container.resolve(HearingTestScreenViewModelProtocol.self) else { return }
        let image: UIImage = .wave
        let viewController = HearingTestViewController(viewModel: viewModel as? HearingTestScreenViewModel ?? HearingTestScreenViewModel())
        let item = UITabBarItem(title: nil, image: image.resizeImage(to: CGSize(width: 45, height: 45)), selectedImage: nil)
        viewController.tabBarItem = item
        viewController.closeClosure = {
            self.navigationController.tabBarController?.tabBar.isHidden = true
            self.showLevelScreen()
        }
        navigationController = UINavigationController(rootViewController: viewController)
        navigationController.isNavigationBarHidden = true
    }

    private func showLevelScreen() {
        guard let viewModel = container.resolve(
            HearingTestLevelScreenViewModelProtocol.self
        ) else { return }
        let viewController = HearingTestLevelScreenViewController(
            viewModel: viewModel as? HearingTestLevelScreenViewModel ?? HearingTestLevelScreenViewModel()
        )
        viewController.exitClosure = {
            self.navigationController.tabBarController?.tabBar.isHidden = false
            self.navigationController.popViewController(animated: true)
        }
        navigationController.pushViewController(
            viewController,
            animated: true
        )
    }
}
