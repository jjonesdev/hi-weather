//
//  MockEndpoint.swift
//  WeatherServiceTests
//
//  Created by Jordan Jones on 3/21/21.
//

import Foundation
import WeatherService

extension Endpoint {
    var mockUrl: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "test.com"
        components.path = "/" + path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
}
