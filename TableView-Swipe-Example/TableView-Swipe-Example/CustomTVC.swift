//
//  CustomTVC.swift
//  TableView-Swipe-Example
//
//  Created by 1v1 on 2022/01/28.
//

import UIKit

class CustomTVC: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
