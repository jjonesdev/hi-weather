//
//  AppStateTests.swift
//  AppStateTests
//
//  Created by Jordan Jones on 3/20/21.
//

import XCTest
@testable import AppState

class AppStateTests: XCTestCase {
    var mockCurentWeatherable: MockCurrentWeatherable!
    
    override func setUp() {
        mockCurentWeatherable = MockCurrentWeatherable()
    }
    
    override func tearDown() {
        mockCurentWeatherable = nil
    }
    
    func testLoadCurrentWeatherIsCalled() {
        // When loadCurrentWeather is called.
        _ = mockCurentWeatherable.loadCurrentWeather()
        
        // Then the method is triggered.
        XCTAssertTrue(mockCurentWeatherable.isLoadCurrentWeatherCalled)
    }
}
