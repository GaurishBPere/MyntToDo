//
//  WeatherApiManager.swift
//  MyntToDo
//
//  Created by Perennial on 07/02/23.
//

import Foundation
import RxSwift

class WeatherApiManager {
    private let weatherService: WeatherServiceProtocol

    init(weatherApiManager: WeatherServiceProtocol) {
        self.weatherService = weatherApiManager
    }
    
    func fetchWeatherApi(urlString: String) -> Observable<Weather> {
        return weatherService.fetchWeatherData(urlString: urlString)        
    }

}
