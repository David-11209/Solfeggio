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
    private var soundTasks: [SoundTask] = []

    init(navigationController: UINavigationController, container: Container) {
        self.navigationController = navigationController
        self.container = container
    }

    func start() {
        guard let viewModel = container.resolve(HearingTestScreenViewModelProtocol.self) else { return }
        let image: UIImage = .wave
        let viewController = HearingTestViewController(viewModel: viewModel)
        let item = UITabBarItem(title: nil, image: image.resizeImage(to: CGSize(width: 45, height: 45)), selectedImage: nil)
        viewController.tabBarItem = item
        viewController.closeClosure = { topicName in
            self.navigationController.tabBarController?.tabBar.isHidden = true
            self.soundTasks = viewModel.getDataSelectedTopic(selectedTopic: topicName)
            self.showLoadingLevelScreen()
        }
        navigationController = UINavigationController(rootViewController: viewController)
        navigationController.isNavigationBarHidden = true
    }

    private func showLoadingLevelScreen() {
        navigationController.tabBarController?.tabBar.isHidden = true
        guard let viewModel = container.resolve(
            LoadingScreenViewModelProtocol.self
        ) else { return }
        let viewController = LoadingScreenViewController(
            viewModel: viewModel
        )
        viewController.endAnimateClosure = {
            self.showLevelScreen(tasks: self.soundTasks)
        }
        navigationController.pushViewController(
            viewController,
            animated: true
        )
    }

    private func showLevelScreen(tasks: [SoundTask]) {
        guard let viewModel = container.resolve(
            HearingTestLevelScreenViewModelProtocol.self
        ) else { return }
        let viewController = HearingTestLevelScreenViewController(
            viewModel: viewModel
        )
        viewModel.setData(soundTask: Set(soundTasks))
        viewController.exitClosure = { result in
            self.showEndLevelScreen(result: result, tasksCount: self.soundTasks.count)
            self.navigationController.tabBarController?.tabBar.isHidden = true
        }
        navigationController.pushViewController(
            viewController,
            animated: true
        )
    }

    private func showEndLevelScreen(result: Int, tasksCount: Int) {
        navigationController.tabBarController?.tabBar.isHidden = true
        guard let viewModel = container.resolve(
            EndKRLevelViewModelProtocol.self
        ) else { return }
        viewModel.setResult(result: result, tasksCount: tasksCount)
        let viewController = EndKRLevelViewController(
            viewModel: viewModel
        )
        viewController.exitClosure = { result in
            if result == "exit" {
                self.navigationController.tabBarController?.tabBar.isHidden = false
                self.navigationController.popToViewController(self.navigationController.viewControllers[0], animated: true)
            } else {
                self.navigationController.popToViewController(self.navigationController.viewControllers[1], animated: false)
                self.showLoadingLevelScreen()
            }
        }
        navigationController.pushViewController(
            viewController,
            animated: true
        )
    }
}
