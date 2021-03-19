//
//  CompletedTableViewCell.swift
//  TaskManager
//
//  Created by Janarthan Subburaj on 12/03/21.
//

import UIKit

class CompletedTableViewCell: UITableViewCell {

    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var CompletedButton: UIButton!
    @IBOutlet weak var TaskDate: UILabel!
    @IBOutlet weak var TaskName: UILabel!
    @IBOutlet weak var Categoryimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
