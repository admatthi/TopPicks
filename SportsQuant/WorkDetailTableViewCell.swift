//
//  WorkDetailTableViewCell.swift
//  SportsQuant
//
//  Created by talal ahmad on 13/10/2022.
//


import UIKit

class WorkDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var toYearTF: UITextField!
    @IBOutlet weak var fromYearTF: UITextField!
    @IBOutlet weak var toMonthTF: UITextField!
    @IBOutlet weak var fromMonthTF: UITextField!
    @IBOutlet weak var companyNameLabel: UITextField!
    
    @IBOutlet weak var companyInPositionLabel: UITextField!
    @IBOutlet weak var companyLocationLabel: UITextField!
    @IBOutlet weak var skipThisSectionButton: UIButton!
    @IBOutlet weak var toDateStackView: UIStackView!
    @IBOutlet weak var presentSwitch: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        toYearTF.attributedPlaceholder = NSAttributedString(
            string: "yyyy",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.2)]
        )
        
        
        fromYearTF.attributedPlaceholder = NSAttributedString(
            string: "yyyy",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.2)]
        )
        
        
        toMonthTF.attributedPlaceholder = NSAttributedString(
            string: "mm",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.2)]
        )
        
        
        fromMonthTF.attributedPlaceholder = NSAttributedString(
            string: "mm",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.2)]
        )
        
        
        companyInPositionLabel.attributedPlaceholder = NSAttributedString(
            string: "Sales Manager",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.2)]
        )
        
        
        companyLocationLabel.attributedPlaceholder = NSAttributedString(
            string: "Menlo Park",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.2)]
        )
        
        companyNameLabel.attributedPlaceholder = NSAttributedString(
            string: "Facebook",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.2)]
        )
      
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
