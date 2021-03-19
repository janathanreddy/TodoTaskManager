//
//  QuitTableViewCell.swift
//  TaskManager
//
//  Created by Admin Macappstudio on 12/03/21.
//

import UIKit
protocol YourCellDelegate : class {
    func didPressButton(_ tag: Int)
}
class QuitTableViewCell: UITableViewCell {

    @IBOutlet weak var Quit: UIButton!
    var cellDelegate: YourCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func QuitAction(_ sender: Any) {
        
        
        cellDelegate?.didPressButton((sender as AnyObject).tag)

    }
    
}
