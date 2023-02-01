//
//  ToDoCoordinator.swift
//  MyntToDo
//
//  Created by Perennial on 01/02/23.
//

import Foundation
import UIKit
import RxSwift

class ToDoCoordinator: Coordinator, StoryboardInitializable {
    var toDoItemVC: ToDoItemVC!
    var rootVC: UINavigationController!
    
    let disposeBag = DisposeBag()
    
    func start() -> UIViewController {
        toDoItemVC = ToDoCoordinator.instantiateViewController(storyboard: .main, identifier: ToDoItemVC.storyboardIdentifier) as? ToDoItemVC
        
        return toDoItemVC
    }
    
    func viewModelBind() {
        toDoItemVC.viewModel.showToDoList.subscribe { _ in
            self.showToDoList()
        }.disposed(by: disposeBag)
    }
}

extension ToDoCoordinator {
    func showToDoList() {
        self.rootVC.popViewController(animated: true)
    }
}
