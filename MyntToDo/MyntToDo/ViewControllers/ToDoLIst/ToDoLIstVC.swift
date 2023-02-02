//
//  ToDoLIstVC.swift
//  MyntToDo
//
//  Created by Perennial on 31/01/23.
//

import UIKit
import RxSwift
import RxCoreLocation
import CoreLocation

class ToDoLIstVC: UIViewController {

    @IBOutlet weak var toDoListView: UITableView!
    @IBOutlet weak var loggedInUserLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var addToDoBtn: UIButton!
    
    var viewModel: ToDoListViewModel!
    let disposeBag = DisposeBag()
    let user = UserManager.shared.currentUser
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
        setupData()
        setupBinding()
        setupNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchToDoItems()
    }
    
    private func setupNavigation() {
        self.navigationItem.setHidesBackButton(true, animated: false)
        let logoutBarButtonItem = UIBarButtonItem(title: "Log Out", style: .done, target: self, action: #selector(logout))
        self.navigationItem.leftBarButtonItem = logoutBarButtonItem
    }
    
    @objc private func logout() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupLocationManager() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    private func setupData() {
        loggedInUserLbl.text = user.name
        dateLbl.text = Date.getCurrentDate()
    }
    
    private func setupBinding() {
        manager.rx
         .didUpdateLocations
         .subscribe(onNext: { _, locations in
             guard !locations.isEmpty,
                 let currentLocation = locations.last else { return }
             self.viewModel.getWeatherData(lat: "\(currentLocation.coordinate.latitude)", long: "\(currentLocation.coordinate.longitude)")
         })
         .disposed(by: disposeBag)
        
        addToDoBtn.rx
            .tap
            .bind { [weak self] in
                self?.viewModel.addToDoItem()
            }.disposed(by: disposeBag)
        
        viewModel.toDoItems.bind(to: toDoListView.rx.items(cellIdentifier: AppConstants.toDoListCellIdentifier, cellType: ToDoCell.self)) { (row, item, cell) in
            cell.setupCell(item)
        }.disposed(by: disposeBag)
        
        toDoListView.rx.modelSelected(ToDoItem.self)
            .subscribe { toDoItem in
                self.viewModel.addToDoItem(toDo: toDoItem)
            }.disposed(by: disposeBag)
        
        toDoListView.rx.itemDeleted
            .subscribe { self.viewModel.deleteToDo(at: $0) }
            .disposed(by: disposeBag)
    }
    
    private func fetchToDoItems() {
        viewModel.fetchToDoItems()
    }

}
