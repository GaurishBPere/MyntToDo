//
//  Helper.swift
//  MyntToDo
//
//  Created by Perennial on 01/02/23.
//

import Foundation
import UIKit
import CoreLocation

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
    static let toDoCollectionViewCell = "ToDoWeatherCell"
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

func compassDirection(for heading: CLLocationDirection) -> String? {
    if heading < 0 { return nil }

    let directions = ["N", "NE", "E", "SE", "S", "SW", "W", "NW"]
    let index = Int((heading + 22.5) / 45.0) & 7
    return directions[index]
}

func dateFormater(dateString: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "H:mm"
    let ogDate = dateFormatter.date(from: dateString)!

    dateFormatter.dateFormat = "h:mm a"
    let formattedDate = dateFormatter.string(from: ogDate)
    return formattedDate
}

func weatherBannerImage() -> String {
  let date = NSDate()
  let calendar = NSCalendar.current
  let currentHour = calendar.component(.hour, from: date as Date)
  let hourInt = Int(currentHour.description)!
  
  let NEW_DAY = 0
  let NOON = 12
  let SUNSET = 18
  let MIDNIGHT = 24

  var imageName = "weatherBanner" 
  if hourInt >= NEW_DAY && hourInt <= NOON {
      imageName = "day"
  } else if hourInt > NOON && hourInt <= SUNSET {
      imageName = "day"
  } else if hourInt > SUNSET && hourInt <= MIDNIGHT {
      imageName = "night"
  }
  
  return imageName
}



