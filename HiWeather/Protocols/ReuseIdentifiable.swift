//
//  ReuseIdentifiable.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/21/21.
//

import Foundation

protocol ReuseIdentifiable {
    static var reuseIdentifer: String { get }
}

extension ReuseIdentifiable {
    static var reuseIdentifer: String {
        String(describing: self)
    }
}
