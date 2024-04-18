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
    }
}
