//
//  ToDoListCoordinator.swift
//  MyntToDo
//
//  Created by Perennial on 01/02/23.
//

import Foundation
import UIKit
import RxSwift

class ToDoListCoordinator: Coordinator, StoryboardInitializable {
    var toDoListVC: ToDoLIstVC!
    var rootVC: UINavigationController!
    var toDoCoordinator: ToDoCoordinator!
    
    let disposeBag = DisposeBag()
    
    func start() -> UIViewController {
        toDoListVC = ToDoListCoordinator.instantiateViewController(storyboard: .main, identifier: ToDoLIstVC.storyboardIdentifier) as? ToDoLIstVC
        
        let viewModel = ToDoListViewModel()
        toDoListVC.viewModel = viewModel
        
        viewModel.showToDo.subscribe { [weak self]  in
            self?.showToDo(toDo: $0)
        }
        
        viewModel.showLogin.subscribe { _ in
            self.showLogin()
        }.disposed(by: disposeBag)
        
        return toDoListVC
    }
}

extension ToDoListCoordinator {
    func showToDo(toDo: ToDoItem?) {
        toDoCoordinator = ToDoCoordinator()
        toDoCoordinator.rootVC = rootVC
        let toDoItemVC = toDoCoordinator.start() as! ToDoItemVC
        let viewModel = ToDoViewModel()
        toDoItemVC.viewModel = viewModel
        toDoItemVC.viewModel.toDoItem = toDo
        toDoCoordinator.viewModelBind()
        self.rootVC.pushViewController(toDoItemVC, animated: true)
    }
    
    func showLogin() {
        self.rootVC.popViewController(animated: true)
    }
}
