//
//  AppState.swift
//  AppState
//
//  Created by Jordan Jones on 3/21/21.
//

import Combine
import WeatherService

public protocol CurrentWeatherable: class {
    func loadCurrentWeather() -> AnyPublisher<CurrentWeather, Error>
}

public final class AppState {
    public static let shared = AppState()
    let weatherService = WeatherService()
}

extension AppState: CurrentWeatherable {
    public func loadCurrentWeather() -> AnyPublisher<CurrentWeather, Error> {
        weatherService.fetchCurrentWeather()
    }
}



