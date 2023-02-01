//
//  UserManager.swift
//  MyntToDo
//
//  Created by Perennial on 01/02/23.
//

import Foundation

class UserManager {
    static let shared = UserManager()
    
    private init () {}
    
    private var loggedInUser: User!
    
    func setLoggedInUser(_ user: User) {
        self.loggedInUser = user
    }
    
    func removeLoggedInUser() {
        self.loggedInUser = nil
    }
    
    func updateToDoItemList(list: [ToDoItem]) {
        self.loggedInUser.toDoItems = list
        updateUserToDatabase()
    }
    
    var currentUser: User {
        return loggedInUser
    }
    
    var loggedInUserToDoList: [ToDoItem] {
        return loggedInUser?.toDoItems ?? []
    }
    
    func updateUserToDatabase() {
        StorageManager.shared.store(loggedInUser, as: AppConstants.userJson)
    }
}
