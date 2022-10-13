//
//  ContactDetailTableViewCell.swift
//  SportsQuant
//
//  Created by talal ahmad on 12/10/2022.
//

import UIKit

class ContactDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var socialLinkTF: UITextField!
    
    @IBOutlet weak var address2TF: UITextField!
    @IBOutlet weak var address1TF: UITextField!
    @IBOutlet weak var websiteLinkTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        socialLinkTF.setUnderLine()
        address2TF.setUnderLine()
        address1TF.setUnderLine()
        websiteLinkTF.setUnderLine()
        phoneTF.setUnderLine()
        emailTF.setUnderLine()

        emailTF.attributedPlaceholder = NSAttributedString(
            string: "john@appleeseed.com",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.2)]
        )
        
        phoneTF.attributedPlaceholder = NSAttributedString(
            string: "(123)456-7890",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.2)]
        )
        
        websiteLinkTF.attributedPlaceholder = NSAttributedString(
            string: "www.example.com",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.2)]
        )
        
        address1TF.attributedPlaceholder = NSAttributedString(
            string: "831 Blueberry Lane",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.2)]
        )
        
        
        address2TF.attributedPlaceholder = NSAttributedString(
            string: "New York, NY 11102",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.2)]
        )
        
        
        socialLinkTF.attributedPlaceholder = NSAttributedString(
            string: "linkedin.com/superman",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.2)]
        )
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
