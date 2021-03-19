//
//  FavouritesTableViewCell.swift
//  TaskManager
//
//  Created by Admin Macappstudio on 11/03/21.
//

import UIKit

class FavouritesTableViewCell: UITableViewCell {

    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var FavouriteButton: UIButton!
    @IBOutlet weak var Categoryimage: UIImageView!
    @IBOutlet weak var TaskDate: UILabel!
    @IBOutlet weak var FavLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        let gradient = CAGradientLayer()
            gradient.frame = self.contentView.bounds
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 0, y: 1)
            gradient.colors = [UIColor.green.cgColor, UIColor.white.cgColor];
            self.contentView.layer.insertSublayer(gradient, at: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
