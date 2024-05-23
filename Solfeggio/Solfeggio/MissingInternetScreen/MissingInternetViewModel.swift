//
//  MissingInternetViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 22.05.2024.
//

import Foundation
protocol MissingInternetViewModelProtocol {
    var connectClosure: (() -> Void)? { get set }
    func checkConnection()
}
class MissingInternetViewModel: MissingInternetViewModelProtocol {
    var connectClosure: (() -> Void)?
    var networkMonitor: NetworkMonitorProtocol
    var timer: Timer?
    init(networkMonitor: NetworkMonitorProtocol) {
        self.networkMonitor = networkMonitor
    }

    func checkConnection() {

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.networkMonitor.startMonitoring()
            guard let networkMonitor = self?.networkMonitor else {return}
            if networkMonitor.isConnected {
                self?.networkMonitor.stopMonitoring()
                self?.connectClosure?()
                self?.timer?.invalidate()
            }
        }
    }
}
