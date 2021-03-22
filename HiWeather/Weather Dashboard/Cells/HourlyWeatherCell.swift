//
//  HourlyWeatherCell.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/21/21.
//

import UIKit

final class HourlyWeatherCell: UICollectionViewCell, ReuseIdentifiable {
    private let hourlyWeatherView = HourlyWeatherView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.styleAsCard()
        setupSubviews()
    }
    
    func setup(date: Int, temperature: Double) {
        hourlyWeatherView.time = Date(timeIntervalSince1970: Double(date)).asShortTime
        hourlyWeatherView.temperature = temperature.asKelvinToFarenheitString
    }
        
    private func setupSubviews() {
        hourlyWeatherView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(hourlyWeatherView)
        
        NSLayoutConstraint.activate([
            hourlyWeatherView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            hourlyWeatherView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
