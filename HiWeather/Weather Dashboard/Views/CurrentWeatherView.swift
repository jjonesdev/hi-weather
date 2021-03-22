//
//  CurrentWeatherView.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/21/21.
//

import UIKit

final class CurrentWeatherView: UIView {
    private lazy var locationLabel = makeCurrentLocationLabel()
    private lazy var temperatureLabel = makeCurrentTemperatureLabel()
    
    var location: String? {
        didSet {
            locationLabel.text = location
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
        let vStack = UIStackView.vertical()
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.addArrangedSubview(locationLabel)
        vStack.addArrangedSubview(temperatureLabel)
        addSubview(vStack)
        
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
        
    private func makeCurrentLocationLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.textAlignment = .center
        
        return label
    }
    
    private func makeCurrentTemperatureLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        
        return label
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

