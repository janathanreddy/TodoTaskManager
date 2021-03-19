//
//  PendingTableViewCell.swift
//  TaskManager
//
//  Created by Admin Macappstudio on 11/03/21.
//

import UIKit

class PendingTableViewCell: UITableViewCell {

    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var PendingButton: UIButton!
    @IBOutlet weak var TaskDate: UILabel!
    @IBOutlet weak var TaskName: UILabel!
    @IBOutlet weak var Categoryimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func Pendingaction(_ sender: Any) {
    }
    
}
