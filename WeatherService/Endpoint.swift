//
//  Endpoint.swift
//  Networking
//
//  Created by Jordan Jones on 3/20/21.
//

import Foundation

public struct Endpoint {
    public var path: String
    public var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    public var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.openweathermap.org"
        components.path = "/" + path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
}

extension Endpoint {
    static var currentWeather: Endpoint {
        Endpoint(
            path: "data/2.5/onecall",
            queryItems: [
                URLQueryItem(name: "lat", value: "42.331429"),
                URLQueryItem(name: "lon", value: "-83.045753"),
                // Generally, I would use CocoaPodKeys for secret/key management.
                // For ease of use in this scenario, I am using the key directly.
                URLQueryItem(name: "appid", value: "fec13dae1190911bb66db2641570454e"),
            ]
        )
    }
}
