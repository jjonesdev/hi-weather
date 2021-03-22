//
//  DailyWeatherCell.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/22/21.
//

import UIKit

final class DailyWeatherCell: UICollectionViewCell, ReuseIdentifiable {
    private let dailyWeatherView = DailyWeatherView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
        
    private func setupSubviews() {
        dailyWeatherView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dailyWeatherView)
        
        NSLayoutConstraint.activate([
            dailyWeatherView.topAnchor.constraint(equalTo: contentView.topAnchor),
            dailyWeatherView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dailyWeatherView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dailyWeatherView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

