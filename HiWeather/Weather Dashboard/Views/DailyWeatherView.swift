//
//  DailyWeatherView.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/22/21.
//

import UIKit

final class DailyWeatherView: UIView {
    private let dateLabel = UILabel()
    private let dayLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let temperatureLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        
        dateLabel.text = "22"
        dayLabel.text = "MON"
        
        descriptionLabel.text = "Sunny, with a high of 55."
        temperatureLabel.text = 239.93.asKelvinToFarenheitString
    }
    
    private func setupSubviews() {
        let parentStack = UIStackView.horizontal(
            distribution: .fillProportionally,
            spacing: Spacing.medium
        )
        
        parentStack.translatesAutoresizingMaskIntoConstraints = false
        parentStack.addArrangedSubview(makeChildStack())
        parentStack.addArrangedSubview(descriptionLabel)
        parentStack.addArrangedSubview(temperatureLabel)
                
        addSubview(parentStack)
        
        NSLayoutConstraint.activate([
            parentStack.topAnchor.constraint(equalTo: topAnchor),
            parentStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            parentStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            parentStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func makeChildStack() -> UIStackView {
        let stack = UIStackView.vertical(spacing: Spacing.extraSmall)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(dateLabel)
        stack.addArrangedSubview(dayLabel)
        
        return stack
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
