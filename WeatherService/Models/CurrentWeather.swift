//
//  CurrentWeather.swift
//  Networking
//
//  Created by Jordan Jones on 3/20/21.
//

import Foundation

// MARK: - WeatherReponse
public struct CurrentWeather: Decodable {
    public let lat: Double
    public let lon: Double
    public let timezone: String
    public let timezoneOffset: Int
    public let current: Current
    public let minutely: [Minutely]
    public let hourly: [Current]
    public let daily: [Daily]
    
    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone, current, minutely, hourly, daily
        case timezoneOffset = "timezone_offset"
    }
}

// MARK: - Current
public struct Current: Decodable {
    public let dt: Int
    public let sunrise: Int?
    public let sunset: Int?
    public let temp: Double
    public let feelsLike: Double
    public let pressure: Int
    public let humidity: Int
    public let dewPoint: Double
    public let uvi: Double
    public let clouds: Int
    public let visibility: Int
    public let windSpeed: Double
    public let windDeg: Int
    public let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp, pressure, humidity, uvi, clouds, visibility, weather
        case feelsLike = "feels_like"
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.dt = try container.decode(Int.self, forKey: .dt)
        self.sunrise = try container.decodeIfPresent(Int.self, forKey: .sunrise)
        self.sunset = try container.decodeIfPresent(Int.self, forKey: .sunset)
        self.temp = try container.decode(Double.self, forKey: .temp)
        self.feelsLike = try container.decode(Double.self, forKey: .feelsLike)
        self.pressure = try container.decode(Int.self, forKey: .pressure)
        self.humidity = try container.decode(Int.self, forKey: .pressure)
        self.dewPoint = try container.decode(Double.self, forKey: .dewPoint)
        self.uvi = try container.decode(Double.self, forKey: .uvi)
        self.clouds = try container.decode(Int.self, forKey: .clouds)
        self.visibility = try container.decode(Int.self, forKey: .visibility)
        self.windSpeed = try container.decode(Double.self, forKey: .windSpeed)
        self.windDeg = try container.decode(Int.self, forKey: .windDeg)
        self.weather = try container.decode([Weather].self, forKey: .weather)
    }
}

// MARK: - Weather
public struct Weather: Decodable {
    public let id: Int
    public let main: String
    public let description: String
    public let icon: String
}

// MARK: - Minutely
public struct Minutely: Decodable {
    public let dt: Int
    public let precipitation: Int
}

// MARK: - Daily
public struct Daily: Decodable {
    public let dt: Int
    public let sunrise: Int
    public let sunset: Int
    public let temp: Temp
    public let feels_like: FeelsLike
    public let pressure: Int
    public let humidity: Int
    public let dew_point: Double
    public let wind_speed: Double
    public let wind_deg: Int
    public let weather: [Weather]
    public let clouds: Int
    public let pop: Double
    public let uvi: Float
}

// MARK: - FeelsLike
public struct FeelsLike: Decodable {
    public let day: Double
    public let night: Double
    public let eve: Double
    public let morn: Double
}

// MARK: - Temp
public struct Temp: Decodable {
    public let day: Double
    public let min: Double
    public let max: Double
    public let night: Double
    public let eve: Double
    public let morn: Double
}
