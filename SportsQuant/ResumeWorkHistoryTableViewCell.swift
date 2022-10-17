//
//  ResumeWorkHistoryTableViewCell.swift
//  SportsQuant
//
//  Created by talal ahmad on 17/10/2022.
//

import UIKit

class ResumeWorkHistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var startEndDateLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
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
