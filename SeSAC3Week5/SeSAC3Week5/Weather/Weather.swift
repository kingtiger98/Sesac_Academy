//
//  Weather.swift
//  SeSAC3Week5
//
//  Created by 황재하 on 8/17/23.
//

import Foundation

// MARK: - Welcome
struct WeatherData: Codable {
    let name: String
    let weather: [Weather]
    let dt: Int
    let main: Main
    let wind: Wind
    let visibility: Int
    let coord: Coord
    let base: String
    let clouds: Clouds
    let id, timezone, cod: Int
    let sys: Sys
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lat, lon: Double
}

// MARK: - Main
struct Main: Codable {
    let grndLevel, humidity, pressure: Int
    let tempMin, feelsLike, temp, tempMax: Double
    let seaLevel: Int

    enum CodingKeys: String, CodingKey {
        case grndLevel = "grnd_level"
        case humidity, pressure
        case tempMin = "temp_min"
        case feelsLike = "feels_like"
        case temp
        case tempMax = "temp_max"
        case seaLevel = "sea_level"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let sunrise, sunset, id, type: Int
    let country: String
}

// MARK: - Weather
struct Weather: Codable {
    let icon: String
    let id: Int
    let main, description: String
}

// MARK: - Wind
struct Wind: Codable {
    let gust, speed: Double
    let deg: Int
}
