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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
