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
            viewModel: viewModel as? KnowledgeRepetitionScreenViewModel ?? KnowledgeRepetitionScreenViewModel()
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
        viewController.viewTappedClosure = {
            self.navigationController.tabBarController?.tabBar.isHidden = true
            self.showTopicsScreen()
        }
        navigationController.isNavigationBarHidden = true
    }

    private func showTopicsScreen() {
        guard let viewModel = container.resolve(
            KnowRepChossingTopicsViewModelProtocol.self
        ) else { return }
        let viewController = KnowRepChossingTopicsViewController(
            viewModel: viewModel as? KnowRepetitionChossingTopicsViewModel ?? KnowRepetitionChossingTopicsViewModel(levelNames: [])
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
