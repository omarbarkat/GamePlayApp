//
//  FirstSectionNibCell.swift
//  GamePlay
//
//  Created by eng.omar on 16/08/2024.
//

import UIKit

class FirstSectionNibCell: UICollectionViewCell {

    
    @IBOutlet weak var FirstBackgroundView: UIView!
    @IBOutlet weak var lblSecTeamSubName: UILabel!
    @IBOutlet weak var lblFirstTeamSubName: UILabel!
    @IBOutlet weak var lblSecTeamName: UILabel!
    @IBOutlet weak var lblFirstTeamName: UILabel!
    @IBOutlet weak var lblMatchDate: UILabel!
    @IBOutlet weak var lblMatchTime: UILabel!
    @IBOutlet weak var imgSecTeamLogo: UIImageView!
    @IBOutlet weak var imgFirstTeamLogo: UIImageView!
    @IBOutlet weak var lblEventSubtitle: UILabel!
    @IBOutlet weak var lblEventTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
