//
//  MockCurrentWeatherable.swift
//  AppStateTests
//
//  Created by Jordan Jones on 3/21/21.
//

import Combine
import AppState
import WeatherService

final class MockCurrentWeatherable: CurrentWeatherable {
    var isLoadCurrentWeatherCalled = false
    
    init() {}
    
    func loadCurrentWeather() -> AnyPublisher<CurrentWeather, Error> {
        isLoadCurrentWeatherCalled = true
        return Empty(completeImmediately: false).eraseToAnyPublisher()
    }
}
