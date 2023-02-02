//
//  LoginViewModel.swift
//  MyntToDo
//
//  Created by Perennial on 01/02/23.
//

import Foundation
import RxSwift

class LoginViewModel {
    
    let emailSubject = PublishSubject<String>()
    let passwordSubject = PublishSubject<String>()
    let showUser = PublishSubject<User>()
    let showError = PublishSubject<String>()
    let showSignUp = PublishSubject<Void>()

    var email: String?
    var password: String?

    var isValidData: Observable<Bool> {
        return Observable.combineLatest(emailSubject, passwordSubject) { email, password in
            let status = email.isValidEmail() && password.isValidPassword()
            self.email = email
            self.password = password
            return status
        }
    }
    
    func loginAction() {
        guard let email = email,
              let password = password,
              let allUsers = StorageManager.shared.retrieve(AppConstants.userJson, as: [User].self) else {
            return
        }
        let user = allUsers.filter { $0.email == email && $0.password == password }
        if user.isEmpty {
            self.showError.onNext(AppConstants.loginErrorMsg)
        } else {
            UserManager.shared.setLoggedInUser(user[0])
            self.showUser.onNext(user[0])
        }
    }
    
    func crash() {
        self.showError.onNext(AppConstants.crashlyticsMsg)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let numbers = [0]
            let _ = numbers[1]
        }
    }
    
}
