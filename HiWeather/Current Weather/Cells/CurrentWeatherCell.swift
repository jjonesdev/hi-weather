//
//  CurrentWeatherCell.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/21/21.
//

import UIKit

final class CurrentWeatherCell: UICollectionViewCell, ReuseIdentifiable {
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        setupSubviews()
    }

    private func style() {
        backgroundColor = .systemBlue
    }
    
    private func setupSubviews() {
        let currentWeatherView = CurrentWeatherView()
        currentWeatherView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(currentWeatherView)
        
        NSLayoutConstraint.activate([
            currentWeatherView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            currentWeatherView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
