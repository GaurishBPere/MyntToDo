//
//  LoginCoordinator.swift
//  MyntToDo
//
//  Created by Perennial on 01/02/23.
//

import Foundation
import UIKit
import RxSwift

class LoginCoordinator: Coordinator, StoryboardInitializable {

    var loginVC: LoginVC!
    var rootVC: UINavigationController!
    var signUpCoordinator: SignUpCoordinator!
    var toDoListCoordinator: ToDoListCoordinator!
    
    let disposeBag = DisposeBag()
    
    func start() -> UIViewController {
        loginVC = LoginCoordinator.instantiateViewController(storyboard: .main, identifier: LoginVC.storyboardIdentifier) as? LoginVC
        
        let viewModel = LoginViewModel()
        loginVC.viewModel = viewModel
        
        viewModel.showError.subscribe { [weak self] in
            self?.showErrorAlert(with: $0)
        }.disposed(by: disposeBag)
        
        viewModel.showSignUp.subscribe { _ in
            self.showSignUp()
        }.disposed(by: disposeBag)
        
        viewModel.showUser.subscribe { [weak self] in
            self?.showToDoList(user: $0)
        }.disposed(by: disposeBag)
        
        return loginVC
    }
}

extension LoginCoordinator {
    func showErrorAlert(with msg: String) {
        loginVC.showAlert(title: "Alert", message: msg)
    }
    
    func showSignUp() {
        signUpCoordinator = SignUpCoordinator()
        signUpCoordinator.rootVC = rootVC
        let signUpVC = signUpCoordinator.start()
        self.rootVC.pushViewController(signUpVC, animated: true)
    }
    
    func showToDoList(user: User) {
        toDoListCoordinator = ToDoListCoordinator()
        toDoListCoordinator.rootVC = rootVC
        let toDoListVC = toDoListCoordinator.start() as! ToDoLIstVC
        self.rootVC.pushViewController(toDoListVC, animated: true)
    }

}
