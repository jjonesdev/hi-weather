//
//  CurrentWeather.swift
//  Networking
//
//  Created by Jordan Jones on 3/20/21.
//

import Foundation

// MARK: - WeatherResponse
public struct WeatherResponse: Codable {
    public let lat: Double
    public let lon: Double
    public let timezone: String
    public let timezoneOffset: Int
    public let current: Current
    public let minutely: [Minutely]
    public let hourly: [Current]
    public let daily: [Daily]

    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lon = "lon"
        case timezone = "timezone"
        case timezoneOffset = "timezone_offset"
        case current = "current"
        case minutely = "minutely"
        case hourly = "hourly"
        case daily = "daily"
    }

    public init(lat: Double, lon: Double, timezone: String, timezoneOffset: Int, current: Current, minutely: [Minutely], hourly: [Current], daily: [Daily]) {
        self.lat = lat
        self.lon = lon
        self.timezone = timezone
        self.timezoneOffset = timezoneOffset
        self.current = current
        self.minutely = minutely
        self.hourly = hourly
        self.daily = daily
    }
}

// MARK: - Current
public struct Current: Codable {
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
    public let windGust: Double?
    public let pop: Int?

    enum CodingKeys: String, CodingKey {
        case dt = "dt"
        case sunrise = "sunrise"
        case sunset = "sunset"
        case temp = "temp"
        case feelsLike = "feels_like"
        case pressure = "pressure"
        case humidity = "humidity"
        case dewPoint = "dew_point"
        case uvi = "uvi"
        case clouds = "clouds"
        case visibility = "visibility"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather = "weather"
        case windGust = "wind_gust"
        case pop = "pop"
    }

    public init(dt: Int, sunrise: Int?, sunset: Int?, temp: Double, feelsLike: Double, pressure: Int, humidity: Int, dewPoint: Double, uvi: Double, clouds: Int, visibility: Int, windSpeed: Double, windDeg: Int, weather: [Weather], windGust: Double?, pop: Int?) {
        self.dt = dt
        self.sunrise = sunrise
        self.sunset = sunset
        self.temp = temp
        self.feelsLike = feelsLike
        self.pressure = pressure
        self.humidity = humidity
        self.dewPoint = dewPoint
        self.uvi = uvi
        self.clouds = clouds
        self.visibility = visibility
        self.windSpeed = windSpeed
        self.windDeg = windDeg
        self.weather = weather
        self.windGust = windGust
        self.pop = pop
    }
}

// MARK: - Weather
public struct Weather: Codable {
    public let id: Int
    public let main: Main
    public let weatherDescription: Description
    public let icon: Icon

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case weatherDescription = "description"
        case icon = "icon"
    }

    public init(id: Int, main: Main, weatherDescription: Description, icon: Icon) {
        self.id = id
        self.main = main
        self.weatherDescription = weatherDescription
        self.icon = icon
    }
}

public enum Icon: String, Codable {
    case the01D = "01d"
    case the01N = "01n"
    case the02D = "02d"
    case the02N = "02n"
    case the03D = "03d"
    case the03N = "03n"
    case the04D = "04d"
    case the04N = "04n"
    case the05D = "05d"
    case the05N = "05n"
    case the06D = "06d"
    case the06N = "06n"
    case the07D = "07d"
    case the07N = "07n"
    case the08D = "08d"
    case the08N = "08n"
    case the09D = "09d"
    case the09N = "09n"
    case the10D = "10d"
    case the10N = "10n"
}

public enum Main: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}

public enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case moderateRain = "moderate rain"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
}

// MARK: - Daily
public struct Daily: Codable {
    public let dt: Int
    public let sunrise: Int
    public let sunset: Int
    public let temp: Temp
    public let feelsLike: FeelsLike
    public let pressure: Int
    public let humidity: Int
    public let dewPoint: Double
    public let windSpeed: Double
    public let windDeg: Int
    public let weather: [Weather]
    public let clouds: Int
    public let pop: Double
    public let uvi: Double
    public let rain: Double?

    enum CodingKeys: String, CodingKey {
        case dt = "dt"
        case sunrise = "sunrise"
        case sunset = "sunset"
        case temp = "temp"
        case feelsLike = "feels_like"
        case pressure = "pressure"
        case humidity = "humidity"
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather = "weather"
        case clouds = "clouds"
        case pop = "pop"
        case uvi = "uvi"
        case rain = "rain"
    }

    public init(dt: Int, sunrise: Int, sunset: Int, temp: Temp, feelsLike: FeelsLike, pressure: Int, humidity: Int, dewPoint: Double, windSpeed: Double, windDeg: Int, weather: [Weather], clouds: Int, pop: Double, uvi: Double, rain: Double?) {
        self.dt = dt
        self.sunrise = sunrise
        self.sunset = sunset
        self.temp = temp
        self.feelsLike = feelsLike
        self.pressure = pressure
        self.humidity = humidity
        self.dewPoint = dewPoint
        self.windSpeed = windSpeed
        self.windDeg = windDeg
        self.weather = weather
        self.clouds = clouds
        self.pop = pop
        self.uvi = uvi
        self.rain = rain
    }
}

// MARK: - FeelsLike
public struct FeelsLike: Codable {
    public let day: Double
    public let night: Double
    public let eve: Double
    public let morn: Double

    enum CodingKeys: String, CodingKey {
        case day = "day"
        case night = "night"
        case eve = "eve"
        case morn = "morn"
    }

    public init(day: Double, night: Double, eve: Double, morn: Double) {
        self.day = day
        self.night = night
        self.eve = eve
        self.morn = morn
    }
}

// MARK: - Temp
public struct Temp: Codable {
    public let day: Double
    public let min: Double
    public let max: Double
    public let night: Double
    public let eve: Double
    public let morn: Double

    enum CodingKeys: String, CodingKey {
        case day = "day"
        case min = "min"
        case max = "max"
        case night = "night"
        case eve = "eve"
        case morn = "morn"
    }

    public init(day: Double, min: Double, max: Double, night: Double, eve: Double, morn: Double) {
        self.day = day
        self.min = min
        self.max = max
        self.night = night
        self.eve = eve
        self.morn = morn
    }
}

// MARK: - Minutely
public struct Minutely: Codable {
    public let dt: Int
    public let precipitation: Int

    enum CodingKeys: String, CodingKey {
        case dt = "dt"
        case precipitation = "precipitation"
    }

    public init(dt: Int, precipitation: Int) {
        self.dt = dt
        self.precipitation = precipitation
    }
}
