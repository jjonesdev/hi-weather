//
//  CurrentWeatherViewController.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/20/21.
//

import UIKit

final class CurrentWeatherViewController: UIViewController {
    private let viewModel: CurrentWeatherViewModel
    
    private lazy var collectionView = UICollectionView(
        frame: view.bounds,
        collectionViewLayout: makeCollectionViewLayout()
    )
        
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
        UICollectionViewCompositionalLayout(sectionProvider: sectionFor(index:environment:))
    }
    
    private func sectionFor(index: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        NSCollectionLayoutSection.fullWidth(groupHeight: .estimated(55))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
