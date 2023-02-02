//
//  LoginVC.swift
//  MyntToDo
//
//  Created by Perennial on 31/01/23.
//

import UIKit
import RxSwift
import RxCocoa

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginBtn: UIButton!
    @IBOutlet private weak var signUpBtn: UIButton!
    @IBOutlet weak var testCrashlyticsBtn: UIButton!
    
    var viewModel: LoginViewModel!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loginBtn.isEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.emailTextField.text = nil
        self.passwordTextField.text = nil
        self.view.endEditing(true)
    }
    
    
    private func setupBinding() {
        emailTextField.rx
            .text
            .orEmpty
            .bind(to: viewModel.emailSubject)
            .disposed(by: disposeBag)
        
        passwordTextField.rx
            .text
            .orEmpty
            .bind(to: viewModel.passwordSubject)
            .disposed(by: disposeBag)
        
        viewModel.isValidData
            .bind(to: loginBtn.rx.isEnabled)
            .disposed(by: disposeBag)
        
        loginBtn.rx
            .tap
            .bind { [weak self] in
                self?.viewModel.loginAction()
            }
            .disposed(by: disposeBag)
        
        signUpBtn.rx
            .tap
            .bind(to: viewModel.showSignUp)
            .disposed(by: disposeBag)
        
        testCrashlyticsBtn.rx
            .tap
            .bind { [weak self] in
                self?.viewModel.crash()
            }
            .disposed(by: disposeBag)
    }

}
