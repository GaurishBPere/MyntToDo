//
//  User.swift
//  MyntToDo
//
//  Created by Perennial on 01/02/23.
//

import Foundation

struct User: Codable {
//    let id: String
    let name: String
    let email: String
    let password: String
    var toDoItems: [ToDoItem]
}
