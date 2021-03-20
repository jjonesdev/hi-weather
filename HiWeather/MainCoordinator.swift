//
//  MainCoordinator.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/20/21.
//

import UIKit

final class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.isHidden = true
    }
    
    func start() {
        let viewController = CurrentWeatherViewController()
        navigationController.pushViewController(viewController, animated: false)
    }
}
