//
//  CurrentWeatherViewController.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/20/21.
//

import UIKit

final class CurrentWeatherViewController: UIViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    
    enum Section: Hashable {}
    enum Item: Hashable {}
    
    private let viewModel: CurrentWeatherViewModel
    
    private lazy var collectionView = UICollectionView(
        frame: view.bounds,
        collectionViewLayout: makeCollectionViewLayout()
    )
    
    private lazy var dataSource = makeDataSource()
            
    init(viewModel: CurrentWeatherViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
    }
    
    private func makeCollectionViewLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout(sectionProvider: section(index:environment:))
    }
    
    private func section(index: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        NSCollectionLayoutSection.fullWidth(groupHeight: .estimated(55))
    }
    
    private func makeDataSource() -> DataSource {
        DataSource(collectionView: collectionView, cellProvider: cell(collectionView:indexPath:item:))
    }
    
    private func cell(collectionView: UICollectionView, indexPath: IndexPath, item: Item) -> UICollectionViewCell {
        UICollectionViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
