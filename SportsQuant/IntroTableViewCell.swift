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
        
        firstNameTextField.keyboardty
        
        firstNameTextField.attributedPlaceholder = NSAttributedString(
            string: "First Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.2)]
        )
        
        lastNameTextField.attributedPlaceholder = NSAttributedString(
            string: "Last Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.2)]
        )
        
        lastNameTextField.setUnderLine()
        firstNameTextField.setUnderLine()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
