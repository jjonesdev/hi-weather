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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    private func setupSubviews() {
        let vStack = makeVerticalStack()
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
    
    private func makeVerticalStack() -> UIStackView {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = Spacing.small
        
        return stack
    }
    
    private func makeCurrentLocationLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.textAlignment = .center
        label.text = "Detroit"
        
        return label
    }
    
    private func makeCurrentTemperatureLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.text = 267.998.toFarenheit
        return label
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

