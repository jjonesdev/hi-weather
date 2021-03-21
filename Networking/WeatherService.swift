//
//  WeatherService.swift
//  Networking
//
//  Created by Jordan Jones on 3/20/21.
//

import Combine

public protocol CurrentWeatherServiceable {
    func loadCurrentWeather() -> AnyPublisher<CurrentWeather, Error>
}

public final class WeatherService {
    public static let shared = WeatherService()
    var urlSession = URLSession.shared
}

extension WeatherService: CurrentWeatherServiceable {
    public func loadCurrentWeather() -> AnyPublisher<CurrentWeather, Error> {
        urlSession.publisher(for: Endpoint.currentWeather.url)
    }
}
