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
- Install the Pods before running the app
- For Firebase services we have used Swift Package Manager

## App details
- User can create, edit and delete a ToDo with a time and date.
- App has weather widget on landing page with all weather details 
- Weather widget's background changes as per day & night time
- User can test crashlytics with button provided on right top of Login screen

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

## App Screenshots

![Login Screen](https://user-images.githubusercontent.com/124017828/216334375-d4b37183-50ac-4f28-b45d-e8cbe5da475e.png)


![SignUp Screen](https://user-images.githubusercontent.com/124017828/216334454-3f48f238-b4fa-4477-a183-fcbd9b0d64b2.png)


![Landing Page - Todo List](https://user-images.githubusercontent.com/124017828/216335362-5e0838c3-7c30-4f69-b009-45b19faa0cd2.png)


![Add Todo Screen](https://user-images.githubusercontent.com/124017828/216335177-b7a1417e-bc9f-4913-bf98-c0e6e32964ca.png)


