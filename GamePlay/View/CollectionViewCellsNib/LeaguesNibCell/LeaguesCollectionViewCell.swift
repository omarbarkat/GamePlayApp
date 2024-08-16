//
//  LeaguesCollectionViewCell.swift
//  GamePlay
//
//  Created by eng.omar on 14/08/2024.
//

import UIKit

class LeaguesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var footballBackgroundView: UIView!
    @IBOutlet weak var lblLeagueName: UILabel!
    @IBOutlet weak var imgLeaguePhoto: UIImageView! {
        didSet {
            imgLeaguePhoto.layer.cornerRadius = 15
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
