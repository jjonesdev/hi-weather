//
//  WeatherDashboardViewController.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/20/21.
//

import UIKit
import Combine
import WeatherService

final class WeatherDashboardViewController: UIViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    enum Section: Hashable {
        case currentWeather
        case hourlyWeather
        case weeklyWeather
    }
    
    enum Item: Hashable {
        case currentWeatherItem
        case hourlyWeatherItem
        case weeklyWeatherItem
    }
    
    private let viewModel: WeatherDashboardViewModel
    private var cancellables: Set<AnyCancellable> = []
    
    private lazy var collectionView = UICollectionView(
        frame: view.bounds,
        collectionViewLayout: makeCollectionViewLayout()
    )
    
    private lazy var dataSource = makeDataSource()
            
    init(viewModel: WeatherDashboardViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        viewModel.perform(.loadCurrentWeather)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        bindViewModelState()
    }
    
    private func bindViewModelState() {
        viewModel.$state
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: update(state:))
            .store(in: &cancellables)
    }
    
    private func update(state: WeatherDashboardViewModel.State) {
        switch state {
        case .idle:
            return
        case .loading:
            print("loading")
        case let .failed(error):
            print(error)
        case let .loaded(currentWeather):
            dataSource.apply(makeSnapshot(with: currentWeather))
        }
    }
    
    private func setupCollectionView() {
        collectionView.register(CurrentWeatherCell.self, forCellWithReuseIdentifier: CurrentWeatherCell.reuseIdentifer)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "hourly-weather-cell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "weekly-weather-cell")
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
    }
    
    private func makeCollectionViewLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout(sectionProvider: section(index:environment:))
    }
    
    private func section(
        index: Int,
        environment: NSCollectionLayoutEnvironment
    ) -> NSCollectionLayoutSection {
        let section = dataSource.snapshot().sectionIdentifiers[index]
        
        switch section {
        case .currentWeather:
            return NSCollectionLayoutSection.fullWidth(groupHeight: .absolute(300))
        case .hourlyWeather:
            return NSCollectionLayoutSection.fullWidth(groupHeight: .absolute(100))
        case .weeklyWeather:
            return NSCollectionLayoutSection.fullWidth(groupHeight: .fractional(1.0))
        }
    }
    
    private func makeDataSource() -> DataSource {
        DataSource(collectionView: collectionView, cellProvider: cell(collectionView:indexPath:item:))
    }
    
    private func cell(
        collectionView: UICollectionView,
        indexPath: IndexPath,
        item: Item
    ) -> UICollectionViewCell {
        switch item {
        case .currentWeatherItem:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CurrentWeatherCell.reuseIdentifer,
                for: indexPath
            )
            return cell
        case .hourlyWeatherItem:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "hourly-weather-cell",
                for: indexPath
            )
            cell.backgroundColor = .systemTeal
            return cell
        case .weeklyWeatherItem:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "weekly-weather-cell",
                for: indexPath
            )
            cell.backgroundColor = .cyan
            return cell
        }
    }
    
    func makeSnapshot(with currentWeather: CurrentWeather) -> Snapshot {
        var snapshot = Snapshot()
        snapshot.appendSections([.currentWeather, .hourlyWeather, .weeklyWeather])
 
        snapshot.appendItems([.currentWeatherItem], toSection: .currentWeather)
        snapshot.appendItems([.hourlyWeatherItem], toSection: .hourlyWeather)
        snapshot.appendItems([.weeklyWeatherItem], toSection: .weeklyWeather)
        
        return snapshot
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
