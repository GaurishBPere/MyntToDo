//
//  Date+Extension.swift
//  MyntToDo
//
//  Created by Perennial on 01/02/23.
//

import Foundation

extension Date {

 static func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormatter.string(from: Date())
    }
}
