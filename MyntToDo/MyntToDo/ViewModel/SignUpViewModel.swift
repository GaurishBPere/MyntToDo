//
//  SignUpViewModel.swift
//  MyntToDo
//
//  Created by Perennial on 01/02/23.
//

import Foundation
import RxSwift
import RxCocoa

class SignUpViewModel {
    
    let emailSubject = PublishSubject<String>()
    let passwordSubject = PublishSubject<String>()
    let nameSubject = PublishSubject<String>()
    let showLogin = PublishSubject<Void>()
    let showError = PublishSubject<String>()
    var user: User?
    
    var isValidData: Observable<Bool> {
        return Observable.combineLatest(emailSubject, passwordSubject, nameSubject) { email, password, name in
            let status = email.isValidEmail() && password.isValidPassword()
            self.user = User(name: name, email: email, password: password, toDoItems: [])
            return status
        }
    }
    
    func signUpAction() {
        guard let user = user,
              let allUsers = StorageManager.shared.retrieve(AppConstants.userJson, as: [User].self) else {
                  return
              }
        let users = allUsers.filter { $0.email == user.email && $0.password == user.password }
        if users.isEmpty {
            StorageManager.shared.store(user, as: AppConstants.userJson)
            self.showLogin.onNext(Void())
        } else {
            self.showError.onNext(AppConstants.loginErrorMsg)
        }
    }
}
