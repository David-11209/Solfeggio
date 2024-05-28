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
    private var level: Level
    private var imageDict: [String: UIImage]

    init(
        navigationController: UINavigationController,
        container: Container
    ) {
        self.level = Level()
        self.imageDict = [:]
        self.navigationController = navigationController
        self.container = container
    }

    var exitLevelClosure: (() -> Void)?

    func start() {
        guard let viewModel = container.resolve(
            MainScreenViewModelProtocol.self
        ) else {
            return
        }
        let image: UIImage = .home
        let viewController = MainScreenViewController(
            viewModel: viewModel
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
        viewController.closeClosure = { tuple in
            self.showTopicsScreen(tuple: tuple)
        }
    }

    private func showTopicsScreen(tuple: (Theme, Float)) {
        navigationController.tabBarController?.tabBar.isHidden = true
        guard let viewModel = container.resolve(
            TopicLevelsScreenViewModelProtocol.self
        ) else { return }
        viewModel.setData(levels: tuple.0.levels, theme: tuple.0, progress: tuple.1)
        let viewController = TopicLevelsScreenViewController(
            viewModel: viewModel
        )
        navigationController.pushViewController(
            viewController,
            animated: true
        )
        viewController.exitClosure = {
            self.navigationController.tabBarController?.tabBar.isHidden = false
            self.navigationController.popViewController(animated: true)
        }
        viewController.didSelectItem = { level in
            self.showLoadingLevelScreen(level: level, theoryImageUrl: nil, theoryText: nil)
        }
        viewController.didSelectTheory = {
            self.showLoadingLevelScreen(level: nil, theoryImageUrl: tuple.0.theoryImage, theoryText: tuple.0.theoryText)
        }
    }

    private func showLoadingLevelScreen(level: Level?, theoryImageUrl: String?, theoryText: String?) {
        navigationController.tabBarController?.tabBar.isHidden = true
        guard let viewModel = container.resolve(
            LoadingScreenViewModelProtocol.self
        ) else { return }
        if let level = level {
            viewModel.setData(tasks: level.tasks)
            let viewController = LoadingScreenViewController(
                viewModel: viewModel
            )
            viewController.allDataDownload = { dict in
                self.level = level
                self.imageDict = dict
                self.showLessonLevelScreen(level: level, imageDict: dict)
            }
            navigationController.pushViewController(
                viewController,
                animated: true
            )
        }
        if let theoryImageUrl = theoryImageUrl {
            viewModel.setTheoryData(url: theoryImageUrl)
            let viewController = LoadingScreenViewController(
                viewModel: viewModel
            )
            viewController.allDataDownload = { dict in
                self.imageDict = dict
                self.showTheoryScreen(text: theoryText ?? "", image: dict.values.first ?? UIImage())
            }
            navigationController.pushViewController(
                viewController,
                animated: true
            )
        }
        exitLevelClosure = {
            self.navigationController.popViewController(animated: false)
        }
    }

    private func showLessonLevelScreen(level: Level, imageDict: [String: UIImage]) {
        navigationController.tabBarController?.tabBar.isHidden = true
        guard let viewModel = container.resolve(
            LessonLevelViewModelProtocol.self
        ) else { return }
        viewModel.setData(tasks: level.tasks, dict: imageDict)
        let viewController = LessonLevelViewController(
            viewModel: viewModel
        )
        viewController.exitClosure = { result in
            self.showEndLevelScreen(level: level, result: result)
        }
        navigationController.pushViewController(
            viewController,
            animated: true
        )
    }

    private func showTheoryScreen(text: String, image: UIImage) {
        print("текст теории\(text)")
        print("картинка теории\(image)")
        navigationController.tabBarController?.tabBar.isHidden = true
        guard let viewModel = container.resolve(
            TheoryViewModelProtocol.self
        ) else { return }
        viewModel.setData(text: text, image: image)
        let viewController = TheoryViewController(viewModel: viewModel)
        navigationController.pushViewController(
            viewController,
            animated: true
        )
        viewController.exitClosure = {
            self.navigationController.popToViewController(self.navigationController.viewControllers[1], animated: true)
        }
    }

    private func showEndLevelScreen(level: Level, result: Bool) {
        navigationController.tabBarController?.tabBar.isHidden = true
        guard let viewModel = container.resolve(
            EndLevelScreenViewModelProtocol.self
        ) else { return }
        viewModel.setResult(level: level, result: result)
        let viewController = EndLevelScreenViewController(
            viewModel: viewModel
        )
        viewController.exitClosure = { result in
            if result == "exit" {
                self.navigationController.popToViewController(self.navigationController.viewControllers[1], animated: true)
            } else {
                self.navigationController.popToViewController(self.navigationController.viewControllers[2], animated: false)
                self.showLoadingLevelScreen(level: self.level, theoryImageUrl: nil, theoryText: nil)
            }
        }
        navigationController.pushViewController(
            viewController,
            animated: true
        )
    }
}
