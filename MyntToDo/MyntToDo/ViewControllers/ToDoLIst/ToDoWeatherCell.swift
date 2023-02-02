//
//  ToDoWeatherCell.swift
//  MyntToDo
//
//  Created by Perennial on 02/02/23.
//

import UIKit

class ToDoWeatherCell: UICollectionViewCell {
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var hourLbl: UILabel!
    
    func setup(temperature: Double, hour: Int) {
        temperatureLbl.text = "\(temperature) °C"
        hourLbl.text = dateFormater(dateString: "\(hour).00")
    }
    
    func dateFormater(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "H:mm"
        let ogDate = dateFormatter.date(from: dateString)!

        dateFormatter.dateFormat = "h:mm a"
        let formattedDate = dateFormatter.string(from: ogDate)
        return formattedDate
    }
}
