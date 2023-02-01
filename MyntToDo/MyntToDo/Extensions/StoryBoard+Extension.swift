//
//  StoryBoard+Extension.swift
//  MyntToDo
//
//  Created by Perennial on 01/02/23.
//

import Foundation
import UIKit

extension StoryboardInitializable where Self:Coordinator {
    static func instantiateViewController(storyboard: StoryBoard, identifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
}
