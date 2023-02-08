//
//  CLLocation+Extension.swift
//  MyntToDo
//
//  Created by Perennial on 07/02/23.
//

import Foundation
import CoreLocation

extension CLLocation {

 func latString() -> String {
     return "\(self.coordinate.latitude)"
   }
    
 func longString() -> String {
        return "\(self.coordinate.longitude)"
    }
}
