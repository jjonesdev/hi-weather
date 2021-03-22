//
//  CurrentWeatherCell.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/21/21.
//

import UIKit

final class CurrentWeatherCell: UICollectionViewCell, ReuseIdentifiable {
    private let currentWeatherView = CurrentWeatherView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.styleAsCard()
        setupSubviews()
    }
    
    func setup(location: String, temperature: Double) {
        currentWeatherView.location = location
        currentWeatherView.temperature = temperature.asKelvinToFarenheitString
    }
    
    private func setupSubviews() {
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
