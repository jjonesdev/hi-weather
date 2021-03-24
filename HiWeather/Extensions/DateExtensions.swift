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
    
    var asAbbreviatedWeekDay: String {
        DateFormatter.abbreviatedWeekDay.string(from: self)
    }
    
    var asDayOfMonth: String {
        DateFormatter.dayOfMonth.string(from: self)
    }
    
    var isToday: Bool {
        Calendar.current.isDateInToday(self)
    }
}
