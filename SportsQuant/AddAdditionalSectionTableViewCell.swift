//
//  AddAdditionalSectionTableViewCell.swift
//  SportsQuant
//
//  Created by talal ahmad on 19/10/2022.
//

import UIKit

class AddAdditionalSectionTableViewCell: UITableViewCell {
    @IBOutlet weak var accomplishImageView: UIImageView!
    @IBOutlet weak var languageImageView: UIImageView!
    @IBOutlet weak var technicalSkillImageView: UIImageView!
    @IBOutlet weak var accomplishmentView: UIView!
    @IBOutlet weak var techSkillsView: UIView!
    @IBOutlet weak var languageView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
