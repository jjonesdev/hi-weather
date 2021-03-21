//
//  WeatherService.swift
//  Networking
//
//  Created by Jordan Jones on 3/20/21.
//

import Combine
import AppState

public protocol CurrentWeatherServiceable {
    func fetchCurrentWeather() -> AnyPublisher<CurrentWeather, Error>
}

public final class WeatherService {
    public static let shared = WeatherService()
    var urlSession = URLSession.shared
}

extension WeatherService: CurrentWeatherServiceable {
    public func fetchCurrentWeather() -> AnyPublisher<CurrentWeather, Error> {
        urlSession.publisher(for: Endpoint.currentWeather.url)
    }
}
