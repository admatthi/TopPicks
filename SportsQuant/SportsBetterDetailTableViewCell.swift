//
//  SportsBetterDetailTableViewCell.swift
//  SportsQuant
//
//  Created by talal ahmad on 11/10/2022.
//

import UIKit

class SportsBetterDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var firstTeamOddValueLabel: UILabel!
    @IBOutlet weak var FirstTeamNameLabel: UILabel!
    @IBOutlet weak var secondTeamOddValueLabel: UILabel!
    @IBOutlet weak var secondTeamNameLabel: UILabel!
    @IBOutlet weak var bookMakerLabel: UILabel!
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
