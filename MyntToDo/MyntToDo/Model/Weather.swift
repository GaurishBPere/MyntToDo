//
//  Weather.swift
//  MyntToDo
//
//  Created by Perennial on 01/02/23.
//

import Foundation

class Weather: Codable {
    let currentWeather: CurrentWeather
    let hourly: Hourly
    
    enum CodingKeys: String, CodingKey {
        case currentWeather = "current_weather"
        case hourly
    }
}

struct CurrentWeather: Codable {
    let temperature, windspeed: Double
    let winddirection, weathercode: Int
    let time: String
}

struct Hourly: Codable {
    let time: [String]
    let temperature2M: [Double]
    
    enum CodingKeys: String, CodingKey {
        case time
        case temperature2M = "temperature_2m"
    }
}


