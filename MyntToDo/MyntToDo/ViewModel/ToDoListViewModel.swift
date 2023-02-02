//
//  ToDoListViewModel.swift
//  MyntToDo
//
//  Created by Perennial on 01/02/23.
//

import Foundation
import RxSwift
import RxCocoa

class ToDoListViewModel {
    
    let showToDo = PublishSubject<ToDoItem?>()
    let toDoItems = BehaviorSubject(value: [ToDoItem]())
    let showLogin = PublishSubject<Void>()
    
    func addToDoItem(toDo: ToDoItem? = nil) {
        showToDo.onNext(toDo)
    }
    
    func fetchToDoItems() {
        toDoItems.onNext(UserManager.shared.loggedInUserToDoList)
    }
    
    func deleteToDo(at indexPath: IndexPath) {
        guard var list = try? toDoItems.value() else { return }
        list.remove(at: indexPath.row)
        UserManager.shared.updateToDoItemList(list: list)
        toDoItems.onNext(list)
    }
    
    func getWeatherData(lat: String, long: String) {
        
        ServiceManager.shared.callService(urlString: urlComponents(lat: "\(lat)", long: "\(long)")) { (response: Weather) in
            print(response)
        } fail: {
            print("error")
        }

    }
}
