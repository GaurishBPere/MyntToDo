//
//  SignUpVC.swift
//  MyntToDo
//
//  Created by Perennial on 31/01/23.
//

import UIKit
import RxSwift

class SignUpVC: UIViewController {
    
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var signUpLoginBtn: UIButton!
    
    var viewModel: SignUpViewModel!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        signUpLoginBtn.isEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.emailTextField.text = nil
        self.passwordTextField.text = nil
        self.nameTextField.text = nil
        self.view.endEditing(true)
    }
    
    private func setupBinding() {
        nameTextField.rx
            .text
            .orEmpty
            .bind(to: viewModel.nameSubject)
            .disposed(by: disposeBag)
        
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
            .bind(to: signUpLoginBtn.rx.isEnabled)
            .disposed(by: disposeBag)
        
        signUpLoginBtn.rx
            .tap
            .bind { [weak self] in
                self?.viewModel.signUpAction()
            }.disposed(by: disposeBag)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
