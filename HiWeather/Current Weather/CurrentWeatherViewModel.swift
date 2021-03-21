//
//  CurrentWeatherViewModel.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/20/21.
//

import Combine
import AppState

final class CurrentWeatherViewModel {
    private let state: CurrentWeatherable
    private var cancellables: Set<AnyCancellable> = []
    weak var delegate: CurrentWeatherCoordinatorDelegate?
    
    init(
        coordinator: CurrentWeatherCoordinatorDelegate,
        state: CurrentWeatherable = AppState.shared
    ) {
        self.delegate = coordinator
        self.state = state
        
        state.loadCurrentWeather()
            .sink { (completion) in
                print(completion)
            } receiveValue: { (response) in
                print(response.current)
            }
            .store(in: &cancellables)
    }
}
