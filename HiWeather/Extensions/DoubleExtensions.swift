//
//  DoubleExtensions.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/21/21.
//

import Foundation

extension Double {
    var asKelvinToFarenheitString: String {
        let temperature = self
        let result = Int((temperature * 9/5 - 459.67))
        return "\(result)℉"
    }
}
