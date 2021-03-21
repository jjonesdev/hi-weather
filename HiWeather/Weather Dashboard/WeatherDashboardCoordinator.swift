//
//  WeatherDashboardCoordinator.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/20/21.
//

import UIKit

protocol WeatherDashboardCoordinatorDelegate: class {}

final class WeatherDashboardCoordinator: Coordinator {
    weak var delegate: MainCoordinatorDelegate?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, coordinator: MainCoordinatorDelegate) {
        self.navigationController = navigationController
        self.delegate = coordinator
    }
    
    func start() {
        let viewModel = WeatherDashboardViewModel(coordinator: self)
        let viewController = WeatherDashboardViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: false)
    }
}

extension WeatherDashboardCoordinator: WeatherDashboardCoordinatorDelegate {}
