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
    
    let disposeBag = DisposeBag()
    
    func start() -> UIViewController {
        loginVC = LoginCoordinator.instantiateViewController(storyboard: .main, identifier: LoginVC.storyboardIdentifier) as? LoginVC
        
        let viewModel = LoginViewModel()
        loginVC.viewModel = viewModel
        
        viewModel.showError.subscribe { [weak self] in
            self?.showErrorAlert(with: $0)
        }.disposed(by: disposeBag)
        
        viewModel.showSignup.subscribe { _ in
            self.showSignUp()
        }.disposed(by: disposeBag)
        
        return loginVC
    }
}

extension LoginCoordinator {
    func showErrorAlert(with msg: String) {
        loginVC.showAlert(title: "Log In", message: msg)
    }
    
    func showSignUp() {
    }

}
