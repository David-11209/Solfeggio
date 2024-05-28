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

        container.register(AudioServiceProtocol.self) { _ in
            AudioService()
        }
        .inObjectScope(.container)

        container.register(CoreDataManagerProtocol.self) { _ in
            CoreDataManager()
        }
        .inObjectScope(.container)

        container.register(NetworkServiceProtocol.self) { _ in
            NetworkService()
        }
        .inObjectScope(.container)

        guard let coreDataManager = container.resolve(CoreDataManagerProtocol.self),
            let audioService = container.resolve(AudioServiceProtocol.self),
            let networkMonitor = container.resolve(NetworkMonitorProtocol.self),
            let networkService = container.resolve(NetworkServiceProtocol.self)
        else { return }

        container.register(ConvertServiceProtocol.self) { _ in
            ConvertService(coreDataManager: coreDataManager)
        }
        .inObjectScope(.container)

        guard let convertService = container.resolve(ConvertServiceProtocol.self) else { return }

        container.register(MissingInternetViewModelProtocol.self) { _ in
            MissingInternetViewModel(networkMonitor: networkMonitor)
        }

        container.register(TabBarFabricProtocol.self) { _ in
            TabBarFabric(container: container)
        }
        .inObjectScope(.container)

        container.register(ProfileScreenViewModelProtocol.self) { _ in
            ProfileScreenViewModel(coreDataManager: coreDataManager)
        }

        container.register(LessonLevelViewModelProtocol.self) { _ in
            LessonLevelViewModel()
        }

        container.register(HearingTestLevelScreenViewModelProtocol.self) { _ in
            HearingTestLevelScreenViewModel(audioService: audioService)
        }

        container.register(TopicLevelsScreenViewModelProtocol.self) { _ in
            TopicLevelsScreenViewModel()
        }

        container.register(KnowRepChossingTopicsViewModelProtocol.self) { _ in
            KnowRepetitionChossingTopicsViewModel()
        }

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
            EndLevelScreenViewModel(coreDataManager: coreDataManager)
        }

        container.register(EndKRLevelViewModelProtocol.self) { _ in
            EndKnowledgeRepetitionLevelViewModel(coreDataManager: coreDataManager)
        }

        container.register(RegistrationViewModelProtocol.self) { _ in
            RegistrationViewModel(networkService: networkService)
        }

        container.register(TheoryViewModelProtocol.self) { _ in
            TheoryViewModel()
        }

        container.register(AuthorizationViewModelProtocol.self) { _ in
            AuthorizationViewModel(networkService: networkService)
        }

        container.register(SettingsViewModelProtocol.self) { _ in
            SettingsViewModel()
        }
        container.register(HearingTestScreenViewModelProtocol.self) { _ in
            HearingTestScreenViewModel(coreDataManager: coreDataManager)
        }
    }
}
