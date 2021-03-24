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
        case dailyWeather
    }
    
    enum Item: Hashable {
        case currentWeatherItem(CurrentWeather)
        case hourlyWeatherItem(Current)
        case dailyWeatherItem(Daily)
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
        view.backgroundColor = .systemGroupedBackground
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
        collectionView.register(HourlyWeatherCell.self, forCellWithReuseIdentifier: HourlyWeatherCell.reuseIdentifer)
        collectionView.register(DailyWeatherCell.self, forCellWithReuseIdentifier: DailyWeatherCell.reuseIdentifer)
        
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func makeCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout(sectionProvider: section(index:environment:))
        layout.register(
            CardBackgroundDecoratorView.self,
            forDecorationViewOfKind: CardBackgroundDecoratorView.reuseIdentifer
        )
        return layout
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
            return makeHourlyWeatherSection()
        case .dailyWeather:
            return makeDailyWeatherSection()
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
        case let .currentWeatherItem(currentWeather):
            return makeCurrentWeatherCell(with: currentWeather, indexPath: indexPath)
        case let .hourlyWeatherItem(hourlyWeather):
            return makeHourlyWeatherCell(with: hourlyWeather, indexPath: indexPath)
        case let .dailyWeatherItem(dailyWeather):
            return makeDailyWeatherCell(with: dailyWeather, indexPath: indexPath)
        }
    }
    
    func makeSnapshot(with currentWeather: CurrentWeather) -> Snapshot {
        var snapshot = Snapshot()
        snapshot.appendSections([.currentWeather, .hourlyWeather, .dailyWeather])
        snapshot.appendItems([.currentWeatherItem(currentWeather)], toSection: .currentWeather)
        snapshot.appendItems(
            makeHourlyWeatherItems(with: currentWeather),
            toSection: .hourlyWeather
        )
        snapshot.appendItems(
            makeDailyWeatherItems(with: currentWeather),
            toSection: .dailyWeather
        )
        
        return snapshot
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: CollectionView Cell Methods
extension WeatherDashboardViewController {
    private func makeCurrentWeatherCell(
        with currentWeather: CurrentWeather,
        indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CurrentWeatherCell.reuseIdentifer,
            for: indexPath
        ) as! CurrentWeatherCell
        
        if let timezone = currentWeather.timezone,
           let current = currentWeather.current {
            cell.setup(location: timezone, temperature: current.temp)
        }
        
        return cell
    }
    
    private func makeHourlyWeatherCell(
        with hourlyWeather: Current,
        indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HourlyWeatherCell.reuseIdentifer,
            for: indexPath
        ) as! HourlyWeatherCell
        
        cell.setup(date: hourlyWeather.dt, temperature: hourlyWeather.temp)
        return cell
    }
    
    private func makeDailyWeatherCell(
        with dailyWeather: Daily,
        indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: DailyWeatherCell.reuseIdentifer,
            for: indexPath
        ) as! DailyWeatherCell
        
        cell.setup(dailyWeather)
        return cell
    }
}


// MARK: CollectView Item Methods
extension WeatherDashboardViewController {
    private func makeHourlyWeatherItems(with currentWeather: CurrentWeather) -> [Item] {
        guard let hourly = currentWeather.hourly else { return [] }
        return hourly
//            .filter { Date(timeIntervalSince1970: Double($0.dt)).isToday }
            .map { Item.hourlyWeatherItem($0) }
    }
    
    private func makeDailyWeatherItems(with currentWeather: CurrentWeather) -> [Item] {
        guard let daily = currentWeather.daily else { return [] }
        return daily.map { Item.dailyWeatherItem($0) }
    }
}

// MARK: CollectionView Layout Methods
extension WeatherDashboardViewController {
    private func makeHourlyWeatherSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.15),
            heightDimension: .estimated(50)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        section.interGroupSpacing = Spacing.small
        
        section.contentInsets = .init(
            top: Spacing.small,
            leading: Spacing.medium,
            bottom: Spacing.small,
            trailing: Spacing.medium
        )
        
        return section
    }
    
    private func makeDailyWeatherSection() -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection.fullWidth(
            groupHeight: .estimated(30),
            interGroupSpacing: Spacing.large,
            contentInsets: .init(
                top: Spacing.large,
                leading: Spacing.large,
                bottom: Spacing.large,
                trailing: Spacing.large
            )
        )
        section.decorationItems = [makeDailyWeatherBackgroundDecorationItem()]
        return section
    }
    
    private func makeDailyWeatherBackgroundDecorationItem() -> NSCollectionLayoutDecorationItem {
        let item = NSCollectionLayoutDecorationItem.background(
            elementKind: CardBackgroundDecoratorView.reuseIdentifer
        )
        
        item.contentInsets = .init(
            top: Spacing.small,
            leading: Spacing.medium,
            bottom: Spacing.small,
            trailing: Spacing.medium
        )
        
        return item
    }
}
