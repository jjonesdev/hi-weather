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
}
