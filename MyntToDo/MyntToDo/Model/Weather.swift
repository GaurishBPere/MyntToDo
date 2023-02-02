//
//  Weather.swift
//  MyntToDo
//
//  Created by Perennial on 01/02/23.
//

import Foundation

class Weather: Codable {
    let currentWeather: CurrentWeather
    let hourly : Hourly
    
    enum CodingKeys: String, CodingKey {
        case currentWeather = "current_weather"
        case hourly = "hourly"
    }
}


//struct Welcome: Codable {
//    let currentWeather: CurrentWeather
//    let hourlyUnits: HourlyUnits
//
//    enum CodingKeys: String, CodingKey {
//        case currentWeather = "current_weather"
//        case hourlyUnits = "hourly_units"
//    }
//}

struct CurrentWeather: Codable {
    let temperature: Int?
    let windspeed: Double?
    let winddirection: Int?
    let weathercode: Int?
    let time: String?
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temperature"
        case windspeed = "windspeed"
        case winddirection = "winddirection"
        case weathercode = "weathercode"
        case time = "time"
    }
}

struct Hourly : Codable {
    let time : [String]?
    let temperature2m : [Double]?
    
    enum CodingKeys: String, CodingKey {
        case time = "time"
        case temperature2m = "temperature_2m"
    }
}

