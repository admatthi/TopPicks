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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
