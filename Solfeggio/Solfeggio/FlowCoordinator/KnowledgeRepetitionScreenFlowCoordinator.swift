//
//  KnowledgeRepetitionScreenFlowCoordinator.swift
//  Solfeggio
//
//  Created by Давид Васильев on 15.04.2024.
//

import Swinject
import UIKit

class KnowledgeRepetitionScreenFlowCoordinator: CoordinatorProtocol {

    var navigationController: UINavigationController
    let container: Container
    var dataTransmissonClosure: (([String]) -> Void)?
    private var imageDict: [String: UIImage] = [:]
    private var tasks: [Task] = []
    var exitLevelClosure: (() -> Void)?

    init(
        navigationController: UINavigationController,
        container: Container
    ) {
        self.navigationController = navigationController
        self.container = container
    }

    func start() {
        guard let viewModel = container.resolve(
            KnowledgeRepetitionSViewModelProtocol.self
        ) else {
            return
        }
        let image: UIImage = .tasks
        let viewController = KnowledgeRepetitionScreenViewController(
            viewModel: viewModel
        )
        let item = UITabBarItem(
            title: nil,
            image: image.resizeImage(
                to: CGSize(
                    width: 45,
                    height: 45
                )
            ),
            selectedImage: nil
        )
        viewController.tabBarItem = item
        navigationController = UINavigationController(
            rootViewController: viewController
        )
        dataTransmissonClosure = { chooseNames in
            viewModel.setChooseNames(names: chooseNames)
        }
        viewController.chooseViewTappedClosure = { names in
            self.navigationController.tabBarController?.tabBar.isHidden = true
            self.showTopicsScreen(names: names)
        }
        viewController.startTappedClosure = {
            self.tasks = viewModel.getTasks()
            self.navigationController.tabBarController?.tabBar.isHidden = true
            self.showLoadingLevelScreen()
        }
        navigationController.isNavigationBarHidden = true
    }

    private func showTopicsScreen(names: [String]) {
        guard let viewModel = container.resolve(
            KnowRepChossingTopicsViewModelProtocol.self
        ) else { return }
        viewModel.setData(names: names)
        let viewController = KnowRepChossingTopicsViewController(viewModel: viewModel)
        viewController.exitClosure = { chooseNames in
            self.dataTransmissonClosure?(chooseNames)
            self.navigationController.tabBarController?.tabBar.isHidden = false
            self.navigationController.popViewController(animated: true)
        }
        navigationController.pushViewController(
            viewController,
            animated: true
        )
    }

    private func showLoadingLevelScreen() {
        navigationController.tabBarController?.tabBar.isHidden = true
        guard let viewModel = container.resolve(
            LoadingScreenViewModelProtocol.self
        ) else { return }
        viewModel.setData(tasks: Set(tasks))
        let viewController = LoadingScreenViewController(
            viewModel: viewModel
        )
        viewController.allDataDownload = { dict in
            self.imageDict = dict
            self.showKnowledgeRepetitionLevel()
        }
        navigationController.pushViewController(
            viewController,
            animated: true
        )
        exitLevelClosure = {
            self.navigationController.popViewController(animated: false)
        }
    }

    private func showKnowledgeRepetitionLevel() {
        guard let viewModel = container.resolve(
            KnowledgeRepetitionLevelVMProtocol.self
        ) else { return }
        viewModel.setData(tasks: Set(tasks), dict: imageDict)
        let viewController = KnowledgeRepetitionLevelViewController(viewModel: viewModel)
        viewController.exitClosure = { result in
            self.showEndLevelScreen(result: result, tasksCount: self.tasks.count)
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
