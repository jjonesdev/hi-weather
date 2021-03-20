//
//  CurrentWeatherCoordinator.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/20/21.
//

import UIKit

final class CurrentWeatherCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinatorDelegate?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, coordinator: MainCoordinatorDelegate) {
      self.navigationController = navigationController
        self.parentCoordinator = coordinator
    }
    
    func start() {
        let viewController = CurrentWeatherViewController()
        navigationController.pushViewController(viewController, animated: false)
    }
}
