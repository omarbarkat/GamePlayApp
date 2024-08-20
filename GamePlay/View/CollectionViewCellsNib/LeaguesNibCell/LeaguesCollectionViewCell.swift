//
//  LeaguesCollectionViewCell.swift
//  GamePlay
//
//  Created by eng.omar on 14/08/2024.
//

import UIKit

class LeaguesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var btnUTube: UIButton!
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

    @IBAction func btnYoutube(_ sender: Any) {
        DispatchQueue.main.async {
                self.openYouTube()
            }
    }
    func openYouTube() {
            var str = lblLeagueName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            str = str.replacingOccurrences(of: " ", with: "")
            print("\(str)")
            UIApplication.shared.open(URL(string: ("https://www.youtube.com/@\(str)"))!, options: [:], completionHandler: nil)
        }
}
