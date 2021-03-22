//
//  DateExtensions.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/21/21.
//

import Foundation

extension Date {
    var asShortTime: String {
        DateFormatter.shortTime.string(from: self)
    }
    
    var isToday: Bool {
        Calendar.current.isDateInToday(self)
    }
}
