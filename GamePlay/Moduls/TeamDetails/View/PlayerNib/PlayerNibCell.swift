//
//  PlayerNibCell.swift
//  GamePlay
//
//  Created by eng.omar on 19/08/2024.
//

import UIKit

class PlayerNibCell: UICollectionViewCell {

    @IBOutlet weak var lblPlayerPosition: UILabel!
    @IBOutlet weak var ViewBackground: UIView!
    @IBOutlet weak var lblPlayerName: UILabel!
    @IBOutlet weak var imgPlayerPhoto: UIImageView!
    {
        didSet {
            imgPlayerPhoto.layer.cornerRadius = imgPlayerPhoto.frame.width / 2

        }

    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
