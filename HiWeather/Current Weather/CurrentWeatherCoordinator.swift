//
//  CurrentWeatherCoordinator.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/20/21.
//

import UIKit

protocol CurrentWeatherCoordinatorDelegate: class {}

final class CurrentWeatherCoordinator: Coordinator {
    weak var delegate: MainCoordinatorDelegate?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(
        navigationController: UINavigationController,
        coordinator: MainCoordinatorDelegate
    ) {
        self.navigationController = navigationController
        self.delegate = coordinator
    }
    
    func start() {
        let viewModel = CurrentWeatherViewModel(coordinator: self)
        let viewController = CurrentWeatherViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: false)
    }
}

extension CurrentWeatherCoordinator: CurrentWeatherCoordinatorDelegate {}
