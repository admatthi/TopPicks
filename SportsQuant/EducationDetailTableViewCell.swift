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
    
    @IBOutlet weak var toYearTF: UITextField!
    @IBOutlet weak var fromYearTF: UITextField!
    @IBOutlet weak var toMonthTF: UITextField!
    @IBOutlet weak var fromMonthTF: UITextField!
    @IBOutlet weak var schoolNameTF: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        toYearTF.setUnderLine()
        fromYearTF.setUnderLine()
        toMonthTF.setUnderLine()
        fromMonthTF.setUnderLine()
        schoolNameTF.setUnderLine()
        
        schoolNameTF.attributedPlaceholder = NSAttributedString(
            string: "e.g. harvard university",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.2)]
        )
        
        fromMonthTF.attributedPlaceholder = NSAttributedString(
            string: "mm",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.2)]
        )
        
        toMonthTF.attributedPlaceholder = NSAttributedString(
            string: "mm",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.2)]
        )
        
        fromYearTF.attributedPlaceholder = NSAttributedString(
            string: "yyyy",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.2)]
        )
        
        toYearTF.attributedPlaceholder = NSAttributedString(
            string: "yyyy",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.2)]
        )
        
    
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
