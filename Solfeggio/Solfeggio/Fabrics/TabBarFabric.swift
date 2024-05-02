//
//  TabBarFabric.swift
//  Solfeggio
//
//  Created by Давид Васильев on 14.04.2024.
//
import Swinject
import UIKit

protocol TabBarFabricProtocol {
    func makeTabBarController() -> UIViewController
}

class TabBarFabric: TabBarFabricProtocol {

    let container: Container

    init(
        container: Container
    ) {
        self.container = container
    }

    func makeTabBarController() -> UIViewController {
        let tabBar: UITabBarController = UITabBarController()
        tabBar.tabBar.backgroundColor = .white

        let mainFlowCoordinator = MainScreenFlowCoordinator(
            navigationController: UINavigationController(),
            container: container
        )
        mainFlowCoordinator.start()

        let hearingTestFlowCoordinator = HearingTestScreenFlowCoordinator(
            navigationController: UINavigationController(),
            container: container
        )
        hearingTestFlowCoordinator.start()

        let knowledgeRepetitionFlowCoordinator = KnowledgeRepetitionScreenFlowCoordinator(
            navigationController: UINavigationController(),
            container: container
        )
        knowledgeRepetitionFlowCoordinator.start()

        let profileFlowCoordinator = ProfileScreenFlowCoordinator(
            navigationController: UINavigationController(),
            container: container
        )
        profileFlowCoordinator.start()

        tabBar.viewControllers = [
            mainFlowCoordinator.navigationController,
            hearingTestFlowCoordinator.navigationController,
            knowledgeRepetitionFlowCoordinator.navigationController,
            profileFlowCoordinator.navigationController
        ]
        tabBar.selectedIndex = 4
        for item in tabBar.tabBar.items ?? [] {
            item.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
            item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 10)
        }
        tabBar.tabBar.isTranslucent = true
        tabBar.tabBar.unselectedItemTintColor = .systemGray2
        tabBar.tabBar.tintColor = .black
        tabBar.tabBar.backgroundColor = .white
        return tabBar
    }
}
