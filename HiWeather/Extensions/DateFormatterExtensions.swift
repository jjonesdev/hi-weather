//
//  DateExtensions.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/21/21.
//

import Foundation

extension DateFormatter {
    static let shortTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("j")
        return formatter
    }()
    
    static let abbreviatedWeekDay: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("E..EEE")
        return formatter
    }()
    
    static let dayOfMonth: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("d")
        return formatter
    }()
}
