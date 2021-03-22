//
//  HourlyWeatherView.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/21/21.
//

import UIKit

final class HourlyWeatherView: UIView {
    private lazy var timeLabel = makeTimeLabel()
    private lazy var temperatureLabel = makeTemperatureLabel()
    
    var time: String? {
        didSet {
            timeLabel.text = time
        }
    }
    
    var temperature: String? {
        didSet {
            temperatureLabel.text = temperature
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    private func setupSubviews() {
        let vStack = UIStackView.vertical(alignment: .center, spacing: Spacing.extraSmall)
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.addArrangedSubview(timeLabel)
        vStack.addArrangedSubview(temperatureLabel)
        
        addSubview(vStack)
        
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func makeTimeLabel() -> UILabel {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .caption2)
        label.textAlignment = .center
        label.text = "5PM"
        return label
    }
    
    private func makeTemperatureLabel() -> UILabel {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textAlignment = .center
        label.text = 238.939.asKelvinToFarenheitString
        return label
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

