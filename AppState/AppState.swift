//
//  AppState.swift
//  AppState
//
//  Created by Jordan Jones on 3/21/21.
//

import Combine

protocol CurrentWeatherable: class {
    func loadCurrentWeather() -> AnyPublisher<CurrentWeather, Error>
}

public final class AppState {}




