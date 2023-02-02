//
//  ToDoViewModel.swift
//  MyntToDo
//
//  Created by Perennial on 01/02/23.
//

import Foundation
import RxSwift
import RxCocoa

class ToDoViewModel {
    
    let titleSubject = PublishSubject<String>()
//    let roleSubject = PublishSubject<String>()
    let dateSubject = PublishSubject<String>()
    let showToDoList = PublishSubject<Void>()
    var toDoItem: ToDoItem?
    var toDoitemToSave: ToDoItem?
    
    var isValidData: Observable<Bool> {
        return Observable.combineLatest(titleSubject, dateSubject) { title, date in
            let status = !title.isEmpty && !date.isEmpty
            self.toDoitemToSave = ToDoItem(title: title, date: date)
            return status
        }

    }
    
    func saveAction() {
        guard let toDoitemToSave = toDoitemToSave else {
            return
        }
        var list = UserManager.shared.loggedInUserToDoList
        if let currentToDoItem = toDoItem {
            for index in 0..<list.count {
                if list[index].title == currentToDoItem.title,
                   list[index].date == currentToDoItem.date {
                    list[index] = toDoitemToSave
                    break
                }
            }
            
        } else {
//            list = list.filter { $0.title == toDoitemToSave.title || $0.date == toDoitemToSave.date }
            list.append(toDoitemToSave)
        }
        UserManager.shared.updateToDoItemList(list: list)
        self.showToDoList.onNext(Void())
    }
}
