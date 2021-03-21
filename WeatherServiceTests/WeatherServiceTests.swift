//
//  NetworkingTests.swift
//  NetworkingTests
//
//  Created by Jordan Jones on 3/20/21.
//

import XCTest
@testable import WeatherService

class WeatherServiceTests: XCTestCase {
    var mockWeatherServiceable: MockWeatherServiceable!
    
    override func setUp() {
        mockWeatherServiceable = MockWeatherServiceable()
    }
    
    override func tearDown() {
        mockWeatherServiceable = nil
    }
    
    func testFetchCurrentWeatherIsCalled() {
        // When fetchCurrentWeather is called.
        _ = mockWeatherServiceable.fetchCurrentWeather()
        
        // Then the method is triggered.
        XCTAssertTrue(mockWeatherServiceable.isFetchCurrentWeatherCalled)
    }
    
    func testEndpointUrlConstruction() {
        // Given this endpoint URL object is created.
        let actual = Endpoint(
            path: "testPath",
            queryItems: [
                URLQueryItem(name: "firstItem", value: "1"),
                URLQueryItem(name: "secondItem", value: "2")
            ]).mockUrl
        
        // When it is compared against this expected URL string.
        let expected = URL(string: "https://test.com/testPath?firstItem=1&secondItem=2")!
        
        // Then they are equal.
        XCTAssertEqual(actual, expected)
    }
}
