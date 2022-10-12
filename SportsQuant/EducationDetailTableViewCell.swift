//
//  EducationDetailTableViewCell.swift
//  SportsQuant
//
//  Created by talal ahmad on 12/10/2022.
//

import UIKit

class EducationDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var skipThisSectionButton: UIButton!
    @IBOutlet weak var toDateStackView: UIStackView!
    @IBOutlet weak var presentSwitch: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
