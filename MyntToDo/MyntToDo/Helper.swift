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
    static let toDoListCellIdentifier = "ToDoCell"
}
