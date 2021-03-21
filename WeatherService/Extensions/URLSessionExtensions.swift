//
//  URLSessionExtensions.swift
//  Networking
//
//  Created by Jordan Jones on 3/20/21.
//

import Combine

extension URLSession {
    func publisher<T: Decodable>(
        for url: URL,
        responseType: T.Type = T.self,
        decoder: JSONDecoder = .init()
    ) -> AnyPublisher<T, Error> {
        dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: responseType, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
