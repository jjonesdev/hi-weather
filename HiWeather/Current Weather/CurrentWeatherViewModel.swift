//
//  CurrentWeatherViewModel.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/20/21.
//

import Foundation

final class CurrentWeatherViewModel {
    weak var delegate: CurrentWeatherCoordinatorDelegate?
    
    init(coordinator: CurrentWeatherCoordinatorDelegate) {
        self.delegate = coordinator
    }
}
