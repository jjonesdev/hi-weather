//
//  UIViewExtensions.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/21/21.
//

import UIKit

extension UIView {
    func styleAsCard() {
        backgroundColor = .white
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray5.cgColor
    }
}
