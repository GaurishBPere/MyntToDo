//
//  AppCoordinator.swift
//  MyntToDo
//
//  Created by Perennial on 01/02/23.
//

import Foundation
import UIKit

protocol Coordinator {
    func start() -> UIViewController
}

final class AppCoordinator : Coordinator {
    private var window : UIWindow?
    
    init(window : UIWindow) {
        self.window = window
    }
    
    var rootViewController: UINavigationController!
    @discardableResult
    func start()-> UIViewController {
        let loginCoordinator = LoginCoordinator()
        let mainVC = loginCoordinator.start() as? LoginVC
        rootViewController = UINavigationController(rootViewController: mainVC!)
        loginCoordinator.rootVC = rootViewController
        self.window?.rootViewController = rootViewController
        self.window?.makeKeyAndVisible()
        return mainVC!
    }
}
