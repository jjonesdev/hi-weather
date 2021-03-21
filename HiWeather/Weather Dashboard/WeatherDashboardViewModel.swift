//
//  WeatherDashboardViewModel.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/20/21.
//

import Combine
import AppState
import WeatherService

final class WeatherDashboardViewModel {
    typealias Completion = Subscribers.Completion
    
    enum Action {
        case loadCurrentWeather
    }
    
    enum State {
        case idle
        case loading
        case failed(Error)
        case loaded(CurrentWeather)
    }
    
    private let appState: CurrentWeatherable
    private var cancellables: Set<AnyCancellable> = []
    weak var delegate: WeatherDashboardCoordinatorDelegate?
    
    @Published private(set) var state: State = .idle
    
    init(coordinator: WeatherDashboardCoordinatorDelegate,
         service: CurrentWeatherable = AppState.shared) {
        self.delegate = coordinator
        self.appState = service
    }
    
    func perform(_ action: Action) {
        switch action {
        case .loadCurrentWeather:
            state = .loading
            appState.loadCurrentWeather()
                .sink(receiveCompletion: completion(_:), receiveValue: update(currentWeather:))
                .store(in: &cancellables)
        }
    }
    
    private func completion(_ completion: Completion<Error>) {
        switch completion {
        case let .failure(error):
            state = .failed(error)
        case .finished:
            return
        }
    }
    
    private func update(currentWeather: CurrentWeather) {
        state = .loaded(currentWeather)
        print("loaded")
    }
}
