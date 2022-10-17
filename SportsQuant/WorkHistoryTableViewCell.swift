//
//  WorkHistoryTableViewCell.swift
//  SportsQuant
//
//  Created by talal ahmad on 17/10/2022.
//

import UIKit

class WorkHistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var postionLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
