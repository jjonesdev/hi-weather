//
//  CurrentWeatherViewModel.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/20/21.
//

import Combine
import Networking

final class CurrentWeatherViewModel {
    private let service: CurrentWeatherServiceable
    private var cancellables: Set<AnyCancellable> = []
    weak var delegate: CurrentWeatherCoordinatorDelegate?
    
    init(
        coordinator: CurrentWeatherCoordinatorDelegate,
        service: CurrentWeatherServiceable = WeatherService.shared
    ) {
        self.delegate = coordinator
        self.service = service
        
        service.loadCurrentWeather()
            .sink { (completion) in
                print(completion)
            } receiveValue: { (response) in
                print(response)
            }
            .store(in: &cancellables)
    }
}
