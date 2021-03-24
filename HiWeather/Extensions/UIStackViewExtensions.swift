//
//  UIStackViewExtensions.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/21/21.
//

import UIKit

extension UIStackView {
    static func vertical(
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        spacing: CGFloat = Spacing.small
    ) -> UIStackView {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.alignment = alignment
        stack.distribution = distribution
        stack.spacing = spacing
        
        return stack
    }
    
    static func horizontal(
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        spacing: CGFloat = Spacing.small
    ) -> UIStackView {
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.alignment = alignment
        stack.distribution = distribution
        stack.spacing = spacing
        
        return stack
    }
}

