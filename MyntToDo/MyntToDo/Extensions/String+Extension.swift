//
//  String+Extension.swift
//  MyntToDo
//
//  Created by Perennial on 01/02/23.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        let passwordReg = "^.{5,}$";
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordReg)
        return passwordPred.evaluate(with: self)
    }
}
