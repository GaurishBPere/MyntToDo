//
//  SignUpCoordinator.swift
//  MyntToDo
//
//  Created by Perennial on 01/02/23.
//

import Foundation
import UIKit
import RxSwift

class SignUpCoordinator: Coordinator, StoryboardInitializable {
    var signUpVC: SignUpVC!
    var rootVC: UINavigationController!
    
    let disposeBag = DisposeBag()
    
    func start() -> UIViewController {
        
        signUpVC = (SignUpCoordinator.instantiateViewController(storyboard: .main, identifier: SignUpVC.storyboardIdentifier) as? SignUpVC)
        let viewModel = SignUpViewModel()
        signUpVC.viewModel = viewModel
        
        viewModel.showError.subscribe { [weak self] in
            self?.showErrorAlert(with: $0)
        }.disposed(by: disposeBag)

        viewModel.showLogin.subscribe { _ in
            self.showLogin()
        }.disposed(by: disposeBag)
        
        return signUpVC
    }
}

extension SignUpCoordinator {
    func showErrorAlert(with msg: String) {
        signUpVC.showAlert(title: "Sign Up", message: msg)
    }
    
    func showLogin() {
        self.rootVC.popViewController(animated: true)
    }
}
