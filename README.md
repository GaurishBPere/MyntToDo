# MyntToDo

Simple ToDo app to maintain our day-to-day tasks or list

## Technical Specifications
- MVVM  
- RxSwift
- RxCoreLocation
- SwiftLint
- Integrated Firebase Crashlytics
- Updated weather info with open-meteo API
- Swift 5.0 
- Minimum iOS version support 16.0
- This app is supported on iPhones in Portrait mode

## User details
- Multi-User application.
- User can create, edit and delete a ToDo with a time and date.
- With updated weather info on the go.

## Project structure
### Under MyntTodo we have ->
* MyntToDo.xcodeproj
* MyntToDo.xcworkspace
* MyntToDo Folder
* Podfile
* README.md

### Inside MyntToDo Folder ->
* Assets.xcassets : 
* Base.lproj
* Coordinator
* Extensions
* Manager
* Model
* ViewControllers
* ViewModel
* AppDelegate.swift
* GoogleService-Info.plist
* Info.plist
* SceneDelegate.swift


### Inside Coordinator: 
* AppCoordinator.swift
* SignUpCoordinator.swift
* ToDoCoordinator.swift
* ToDoListCoordinator.swift


### Inside Extensions:
* Date+Extension.swift
* StoryBoard+Extension.swift
* String+Extension.swift
* UITextField+Extension.swift
* UIViewController+Extension.swift


### Inside Manager:
* ServiceManager.swift
* StorageManager.swift
* UserManager.swift


### Inside Model:
* ToDoItem.swift
* User.swift
* Weather.swift


### Inside ViewControllers:
* ToDoLIst Folder
  * -- ToDoCell.swift
  * --  ToDoLIstVC.swift
  * -- ToDoWeatherCell.swift
* LoginVC.swift
* SignUpVC.swift
* ToDoItemVC.swift


### Inside ViewModel:
* LoginViewModel.swift
* SignUpViewModel.swift
* ToDoListViewModel.swift
* ToDoViewModel.swift

## Weather api by https://open-meteo.com/en/docs#api_form
- Api : https://api.open-meteo.com/v1/forecast?latitude=37.785834&longitude=-122.406417&hourly=temperature_2m&current_weather=true
- Using above api we fetched current weather details such as current temperature, windspeed, wind direction & hourly temperatures.

## Crashlytics
- https://console.firebase.google.com/project/mynttodo/crashlytics/app/ios:com.pere.MyntToDo/issues?state=open&time=last-seven-days&tag=all&sort=eventCount
- Note* Firebase console will be accessible only once the permisiion is given to respective user.

<img width="1429" alt="Screenshot 2023-02-02 at 5 35 54 PM" src="https://user-images.githubusercontent.com/124017828/216322529-bbcf4834-9ff6-40fe-a0d1-d0d27fde3757.png">
