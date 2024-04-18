//
//  CoordinatorProtocol.swift
//  Solfeggio
//
//  Created by Давид Васильев on 14.04.2024.
//

import UIKit

protocol CoordinatorProtocol {
    var navigationController: UINavigationController { get }
    func start()
}
