//
//  ContainerAssembly.swift
//  Solfeggio
//
//  Created by Давид Васильев on 14.04.2024.
//

import Swinject

class ContainerAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(NetworkMonitorProtocol.self) { _ in
            NetworkMonitor()
        }
        .inObjectScope(.container)
        guard let networkMonitor = container.resolve(NetworkMonitorProtocol.self)  else { return }

        container.register(MissingInternetViewModelProtocol.self) { _ in
            MissingInternetViewModel(networkMonitor: networkMonitor)
        }

        container.register(TabBarFabricProtocol.self) { _ in
            TabBarFabric(container: container)
        }
        .inObjectScope(.container)

        container.register(ProfileScreenViewModelProtocol.self) { _ in
            ProfileScreenViewModel()
        }

        container.register(LessonLevelViewModelProtocol.self) { _ in
            LessonLevelViewModel()
        }

        container.register(AudioServiceProtocol.self) { _ in
            AudioService()
        }
        guard let audioService = container.resolve(AudioServiceProtocol.self)  else { return }
        container.register(HearingTestLevelScreenViewModelProtocol.self) { _ in
            HearingTestLevelScreenViewModel(audioService: audioService)
        }

        container.register(TopicLevelsScreenViewModelProtocol.self) { _ in
            TopicLevelsScreenViewModel()
        }

        container.register(KnowRepChossingTopicsViewModelProtocol.self) { _ in
            KnowRepetitionChossingTopicsViewModel()
        }

        container.register(CoreDataManagerProtocol.self) { _ in
            CoreDataManager()
        }
        .inObjectScope(.container)

        container.register(NetworkServiceProtocol.self) { _ in
            NetworkService()
        }
        .inObjectScope(.container)

        guard let coreDataManager = container.resolve(CoreDataManagerProtocol.self)  else { return }

        container.register(ConvertServiceProtocol.self) { _ in
            ConvertService(coreDataManager: coreDataManager)
        }
        .inObjectScope(.container)

        guard let networkService = container.resolve(NetworkServiceProtocol.self),
            let convertService = container.resolve(ConvertServiceProtocol.self) else { return }

        container.register(MainScreenViewModelProtocol.self) { _ in
            MainScreenViewModel(coreDataManager: coreDataManager, networkService: networkService, convertService: convertService)
        }

        container.register( KnowledgeRepetitionSViewModelProtocol.self) { _ in
            KnowledgeRepetitionScreenViewModel(coreDataManager: coreDataManager)
        }

        container.register(KnowledgeRepetitionLevelVMProtocol.self) { _ in
            KnowledgeRepetitionLevelViewModel()
        }

        container.register(LoadingScreenViewModelProtocol.self) { _ in
            LoadingScreenViewModel()
        }

        container.register(EndLevelScreenViewModelProtocol.self) { _ in
            EndLevelScreenViewModel()
        }

        container.register(EndKRLevelViewModelProtocol.self) { _ in
            EndKnowledgeRepetitionLevelViewModel()
        }

        container.register(HearingTestScreenViewModelProtocol.self) { _ in
            HearingTestScreenViewModel(coreDataManager: coreDataManager)
        }
    }
}
