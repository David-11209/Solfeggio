//
//  MainScreenFlowCoordinator.swift
//  Solfeggio
//
//  Created by Давид Васильев on 14.04.2024.
//

import Swinject
import UIKit

class MainScreenFlowCoordinator: CoordinatorProtocol {

    var navigationController: UINavigationController
    let container: Container

    init(
        navigationController: UINavigationController,
        container: Container
    ) {
        self.navigationController = navigationController
        self.container = container
    }

    func start() {
        guard let viewModel = container.resolve(
            MainScreenViewModelProtocol.self
        ) else {
            return
        }
        let image: UIImage = .home
        let viewController = MainScreenViewController(
            viewModel: viewModel as? MainScreenViewModel ?? MainScreenViewModel()
        )
        let item = UITabBarItem(
            title: nil,
            image: image.resizeImage(
                to: CGSize(
                    width: 40,
                    height: 40
                )
            ),
            selectedImage: nil
        )
        item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 20)
        viewController.tabBarItem = item
        navigationController = UINavigationController(
            rootViewController: viewController
        )
        navigationController.isNavigationBarHidden = true
        viewController.closeClosure = {
            self.showTopicsScreen()
        }
    }

    private func showTopicsScreen() {
        navigationController.tabBarController?.tabBar.isHidden = true
        guard let viewModel = container.resolve(
            TopicLevelsScreenViewModelProtocol.self
        ) else { return }

        let viewController = TopicLevelsScreenViewController(
            viewModel: viewModel as? TopicLevelsScreenViewModel ?? TopicLevelsScreenViewModel(
                levelNames: []
            )
        )
        navigationController.pushViewController(
            viewController,
            animated: true
        )
        viewController.exitClosure = {
            self.navigationController.tabBarController?.tabBar.isHidden = false
            self.navigationController.popViewController(animated: true)
        }
        viewController.didSelectItem = { indexPath in
            self.showLessonLevelScreen(indexPath: indexPath)
        }
    }

    private func showLessonLevelScreen(indexPath: IndexPath) {
        navigationController.tabBarController?.tabBar.isHidden = true
        guard let viewModel = container.resolve(
            LessonLevelViewModelProtocol.self
        ) else { return }

        let viewController = LessonLevelViewController(
            viewModel: viewModel as? LessonLevelViewModel ?? LessonLevelViewModel()
        )
        viewController.exitClosure = {
            self.navigationController.popViewController(animated: true)
        }
        navigationController.pushViewController(
            viewController,
            animated: true
        )
    }
}
