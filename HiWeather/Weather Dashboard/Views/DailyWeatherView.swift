//
//  DailyWeatherView.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/22/21.
//

import UIKit

final class DailyWeatherView: UIView {
    private lazy var dateLabel = makeDateLabel()
    private lazy var dayLabel = makeDayLabel()
    private lazy var descriptionLabel = makeSubheadlineLabel()
    private lazy var temperatureLabel = makeSubheadlineLabel()
    
    var weatherDescription: String? {
        didSet {
            descriptionLabel.text = weatherDescription
        }
    }
    
    var temperature: String? {
        didSet {
            temperatureLabel.text = temperature
        }
    }
    
    var dayOfMonth: String? {
        didSet {
            dateLabel.text = dayOfMonth
        }
    }
    
    var abbreviatedWeekDay: String? {
        didSet {
            dayLabel.text = abbreviatedWeekDay
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        
        dateLabel.textAlignment = .center
        dayLabel.textAlignment = .center
    }
    
    private func setupSubviews() {
        let parentStack = UIStackView.horizontal(spacing: Spacing.large)
        
        parentStack.translatesAutoresizingMaskIntoConstraints = false
        parentStack.addArrangedSubview(makeChildStack())
        parentStack.addArrangedSubview(descriptionLabel)
        parentStack.addArrangedSubview(temperatureLabel)
                
        addSubview(parentStack)
        
        descriptionLabel.setContentHuggingPriority(.init(200), for: .horizontal)
        
        NSLayoutConstraint.activate([
            parentStack.topAnchor.constraint(equalTo: topAnchor),
            parentStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            parentStack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func makeChildStack() -> UIStackView {
        let stack = UIStackView.vertical(spacing: Spacing.extraSmall)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(dateLabel)
        stack.addArrangedSubview(dayLabel)
        
        stack.widthAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        
        return stack
    }
    
    private func makeDayLabel() -> UILabel {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .caption1)
        
        return label
    }
    
    private func makeDateLabel() -> UILabel {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .caption2)
        
        return label
    }
    
    private func makeSubheadlineLabel() -> UILabel {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        
        return label
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
