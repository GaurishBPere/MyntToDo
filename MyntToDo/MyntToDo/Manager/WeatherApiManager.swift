//
//  WeatherApiManager.swift
//  MyntToDo
//
//  Created by Perennial on 07/02/23.
//

import Foundation
import RxSwift

class WeatherApiManager {
    var serviceManaging: ServiceManaging
    
    internal init(weatherApiManager: ServiceManaging) {
        self.serviceManaging = weatherApiManager
    }
    
}
