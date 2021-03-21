//
//  CurrentWeatherCell.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/21/21.
//

import UIKit

final class CurrentWeatherCell: UICollectionViewCell, ReuseIdentifiable {
    private lazy var currentLocationLabel = makeCurrentLocationLabel()
    private lazy var currentTemperatureLabel = makeCurrentTemperatureLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        setupSubviews()
    }
    
    private func style() {
        backgroundColor = .systemBlue
    }
    
    private func setupSubviews() {
        let vStack = makeVerticalStack()
        vStack.addArrangedSubview(currentLocationLabel)
        vStack.addArrangedSubview(currentTemperatureLabel)
        contentView.addSubview(vStack)
        
        NSLayoutConstraint.activate([
            vStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            vStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
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
        label.text = "Detroit, MI"
        
        return label
    }
    
    private func makeCurrentTemperatureLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.text = "62"
        
        return label
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
