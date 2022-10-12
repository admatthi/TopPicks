//
//  IntroTableViewCell.swift
//  SportsQuant
//
//  Created by talal ahmad on 12/10/2022.
//

import UIKit

class IntroTableViewCell: UITableViewCell {

    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
