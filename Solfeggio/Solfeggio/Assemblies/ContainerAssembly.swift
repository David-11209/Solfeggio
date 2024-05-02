//
//  ContainerAssembly.swift
//  Solfeggio
//
//  Created by Давид Васильев on 14.04.2024.
//

import Swinject

class ContainerAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(MainScreenViewModelProtocol.self) { _ in
            MainScreenViewModel()
        }

        container.register(HearingTestScreenViewModelProtocol.self) { _ in
            HearingTestScreenViewModel()
        }

        container.register(TabBarFabricProtocol.self) { _ in
            TabBarFabric(container: container)
        }
        .inObjectScope(.container)

        container.register( KnowledgeRepetitionSViewModelProtocol.self) { _ in
            KnowledgeRepetitionScreenViewModel()
        }

        container.register( ProfileScreenViewModelProtocol.self) { _ in
            ProfileScreenViewModel()
        }

        container.register( LessonLevelViewModelProtocol.self) { _ in
            LessonLevelViewModel()
        }

        container.register( HearingTestLevelScreenViewModelProtocol.self) { _ in
            HearingTestLevelScreenViewModel()
        }

        container.register( TopicLevelsScreenViewModelProtocol.self) { _ in
            TopicLevelsScreenViewModel(levelNames: ["1", "1", "1", "1", "1", "1", "1", "1", "1", "1"])
        }

        container.register(KnowRepChossingTopicsViewModelProtocol.self) { _ in
            KnowRepetitionChossingTopicsViewModel(levelNames: [
                "Нотная грамота",
                "Все о тональностях",
                "Все о ладах",
                "Все об интервалах",
                "Основные аккорды",
                "Секстаккорды",
                "Квартсекстаккорды"
            ])
        }
    }
}
