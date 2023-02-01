//
//  ToDoCell.swift
//  MyntToDo
//
//  Created by Perennial on 31/01/23.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var toDoTitleLbl: UILabel!
    @IBOutlet weak var dateTimeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(_ toDo: ToDoItem) {
        toDoTitleLbl.text = toDo.title
        dateTimeLbl.text = "\(toDo.date)"
    }

}
