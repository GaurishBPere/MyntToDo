//
//  Helper.swift
//  MyntToDo
//
//  Created by Perennial on 01/02/23.
//

import Foundation
import UIKit

enum StoryBoard: String {
    case main = "Main"
}
protocol StoryboardInitializable {
    static func instantiateViewController(storyboard: StoryBoard, identifier: String) -> UIViewController
}

class AppConstants {
    static let userJson = "Users.json"
    static let loginErrorMsg = "Please enter valid email and password"
    static let crashlyticsMsg = "Developer will get notified about this crash"
    static let toDoListCellIdentifier = "ToDoCell"
}

func urlComponents(lat: String, long: String) -> String {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "api.open-meteo.com"
    components.path = "/v1/forecast"
    
    components.queryItems = [
        URLQueryItem(name: "latitude", value: "\(lat)"),
        URLQueryItem(name: "longitude", value: "\(long)"),
        URLQueryItem(name: "hourly", value: "temperature_2m"),
        URLQueryItem(name: "current_weather", value: "true")
        
    ]
    return components.string ?? ""
}

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentsDirectory = paths[0]
    return documentsDirectory
}



