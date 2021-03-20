//
//  MainCoordinator.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/20/21.
//

import UIKit

protocol MainCoordinatorDelegate: class {}

final class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.isHidden = true
    }
    
    func start() {
        let child = CurrentWeatherCoordinator(
            navigationController: navigationController,
            coordinator: self
        )
        childCoordinators.append(child)
        child.start()
    }
}

extension MainCoordinator: MainCoordinatorDelegate {}
