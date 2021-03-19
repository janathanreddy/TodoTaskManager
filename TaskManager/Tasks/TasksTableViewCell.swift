//
//  TasksTableViewCell.swift
//  TaskManager
//
//  Created by Admin Macappstudio on 11/03/21.
//

import UIKit

class TasksTableViewCell: UITableViewCell {

    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var favouritebtn: UIButton!
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var TaskName: UILabel!
    @IBOutlet weak var Categorymage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
   
}
