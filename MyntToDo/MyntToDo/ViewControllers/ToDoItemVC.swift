//
//  ToDoItemVC.swift
//  MyntToDo
//
//  Created by Perennial on 31/01/23.
//

import UIKit
import RxSwift

class ToDoItemVC: UIViewController {

    @IBOutlet weak var todoTitleTextField: UITextField!
    @IBOutlet weak var todoDateTextField: UITextField!
    @IBOutlet weak var addToDoBtn: UIButton!

    var viewModel: ToDoViewModel!
    let disposeBag = DisposeBag()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setEmploye()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addToDoBtn.isEnabled = false
    }
    
    private func setEmploye() {
        guard let toDoItem = viewModel.toDoItem else {
            return
        }
        todoTitleTextField.text = toDoItem.title
        todoDateTextField.text = toDoItem.date
        viewModel.titleSubject.onNext(toDoItem.title)
        viewModel.dateSubject.onNext(toDoItem.date)
    }
    
    private func setupBindings() {
        todoDateTextField.setInputViewDatePicker(target: self, selector: #selector(doneAction))
        
        addToDoBtn.rx
            .tap
            .bind { [weak self] in
                self?.viewModel.saveAction()
            }.disposed(by: disposeBag)
        
        todoTitleTextField.rx
            .text
            .orEmpty
            .bind(to: viewModel.titleSubject)
            .disposed(by: disposeBag)
        
        todoDateTextField.rx
            .text
            .orEmpty
            .bind(to: viewModel.dateSubject)
            .disposed(by: disposeBag)
        
        viewModel.isValidData
            .bind(to: addToDoBtn.rx.isEnabled)
            .disposed(by: disposeBag)
    }
    
    @objc private func doneAction() {
        if let datePicker = self.todoDateTextField.inputView as? UIDatePicker {
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .medium
            let date = dateformatter.string(from: datePicker.date)
            self.todoDateTextField.text = date
            self.viewModel.dateSubject.onNext(date)
        }
        self.todoDateTextField.resignFirstResponder()
    }

}
