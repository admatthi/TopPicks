//
//  SummaryDetailTableViewCell.swift
//  SportsQuant
//
//  Created by talal ahmad on 13/10/2022.
//

import UIKit

class SummaryDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var summaryTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        summaryTextView.layer.cornerRadius = 10
        summaryTextView.layer.masksToBounds = true
        summaryTextView.layer.borderColor = UIColor.white.cgColor
        summaryTextView.layer.borderWidth = 1
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
