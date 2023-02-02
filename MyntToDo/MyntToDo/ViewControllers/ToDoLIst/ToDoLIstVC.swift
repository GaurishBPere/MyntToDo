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
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var windSpeedLbl: UILabel!
    @IBOutlet weak var winddirectionLbl: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var weatherCollectionView: UICollectionView!
    @IBOutlet weak var windString: UILabel!
    @IBOutlet weak var windStringLbl: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    lazy private var addToDoBarButtonItem : UIBarButtonItem = {
        [unowned self] in
        return UIBarButtonItem(title: "Add Todo", style: .done, target: self, action: nil)
    }()
    
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
        self.navigationItem.rightBarButtonItem = addToDoBarButtonItem
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
        weatherImageView.image = UIImage(named: weatherBannerImage())
    }
    
    private func setupBinding() {
        
        manager.delegate = nil
        manager.rx
            .didUpdateLocations
            .subscribe(onNext: { _, locations in
                guard !locations.isEmpty,
                      let currentLocation = locations.last else { return }
                self.toggleElement(value: true)
                ServiceManager.shared.callService(urlString: urlComponents(lat: "\(currentLocation.coordinate.latitude)", long: "\(currentLocation.coordinate.longitude)")) { (response: Weather) in
                    self.updateWeatherWidget(response: response)
                } fail: {
                    print("error")
                }
            })
            .disposed(by: disposeBag)
        
        addToDoBarButtonItem.rx
            .tap
            .bind { [weak self] in
                self?.viewModel.addToDoItem()
            }.disposed(by: disposeBag)
        
        toDoListView.delegate = nil
        toDoListView.dataSource = nil
        toDoListView.rx.setDelegate(self).disposed(by: disposeBag)
        
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
    
    private func loadHourlyWeatherCollectionView(response: Weather) {
        weatherCollectionView.delegate = nil
        weatherCollectionView.dataSource = nil
        
        let data = Observable.of(response.hourly.temperature2M.prefix(upTo: 24))
        data.bind(to: weatherCollectionView.rx.items) { collectionView, index, item in
            let indexPath = IndexPath(item: index, section: 0)
            let cell: ToDoWeatherCell =
            collectionView.dequeueReusableCell(withReuseIdentifier: AppConstants.toDoCollectionViewCell, for: indexPath) as! ToDoWeatherCell
            cell.setup(temperature: item, hour: index)
            return cell
        }
        .disposed(by: disposeBag)
    }
    
    private func updateWeatherWidget(response: Weather) {
        DispatchQueue.main.async { [self] in
            temperatureLbl.text = "\(response.currentWeather.temperature) °C"
            windSpeedLbl.text = "\(response.currentWeather.windspeed)"
            winddirectionLbl.text = compassDirection(for: CLLocationDirection(response.currentWeather.winddirection))
            toggleElement(value: false)
            loadHourlyWeatherCollectionView(response: response)
        }
    }
    
    func toggleElement(value: Bool) {
        windString.isHidden = value ? true : false
        windStringLbl.isHidden = value ? true : false
        activityIndicator.isHidden = value ? false : true
        
        if value {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}

extension ToDoLIstVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}
