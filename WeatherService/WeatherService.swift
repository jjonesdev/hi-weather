//
//  WeatherService.swift
//  Networking
//
//  Created by Jordan Jones on 3/20/21.
//

import Combine

public protocol WeatherServiceable {
    func fetchCurrentWeather() -> AnyPublisher<CurrentWeather, Error>
}

public final class WeatherService {
    var urlSession = URLSession.shared
    
    public init() {}
}

extension WeatherService: WeatherServiceable {
    public func fetchCurrentWeather() -> AnyPublisher<CurrentWeather, Error> {
        urlSession.publisher(for: Endpoint.currentWeather.url)
    }
}
