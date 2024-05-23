//
//  NetworkMonitor.swift
//  Solfeggio
//
//  Created by Давид Васильев on 22.05.2024.
//

import Foundation
import Network

protocol NetworkMonitorProtocol {
    var isConnected: Bool { get set }
    func startMonitoring()
    func stopMonitoring()
}

final class NetworkMonitor: NetworkMonitorProtocol {
    private let queue = DispatchQueue(label: "NetworkConnectivityMonitor")
    private var monitor: NWPathMonitor?

    var isConnected = false

    func startMonitoring() {
        monitor = NWPathMonitor()
        monitor?.start(queue: queue)
        monitor?.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status != .unsatisfied
        }
    }

    func stopMonitoring() {
        monitor?.cancel()
    }
}
