//
//  MockWeatherServiceable.swift
//  WeatherServiceTests
//
//  Created by Jordan Jones on 3/21/21.
//

import Combine
import WeatherService

final class MockWeatherServiceable: WeatherServiceable {
    var isFetchCurrentWeatherCalled = false
    
    init() {}
    
    func fetchCurrentWeather() -> AnyPublisher<CurrentWeather, Error> {
        isFetchCurrentWeatherCalled = true
        return Empty(completeImmediately: false).eraseToAnyPublisher()
    }
}
