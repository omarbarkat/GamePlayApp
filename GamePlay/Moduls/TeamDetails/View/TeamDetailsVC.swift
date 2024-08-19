//
//  TeamDetailsVC.swift
//  GamePlay
//
//  Created by eng.omar on 19/08/2024.
//

import UIKit

class TeamDetailsVC: UIViewController {
    // Outlets:
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var imgHeaderBackground: UIImageView!
    @IBOutlet weak var lblTeamCountry: UILabel!
    @IBOutlet weak var lblTeamName: UILabel!
    @IBOutlet weak var imgTeamLogo: UIImageView!
    var teamDetailsViewModel: TeamDetailsViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        teamDetailsViewModel = TeamDetailsViewModel(teamID: teamDetailsViewModel!.teamID)
        CollectionView.delegate = self
        CollectionView.dataSource = self
        CollectionView.RegisterNib(cell: PlayerNibCell.self)
        setupUI()
 

        teamDetailsViewModel?.getData(completionHandler: { [self ] response in
            setupUI()
            self.CollectionView.reloadData()
            
        })
      
        
    }
    // Actions:
    @IBAction func btnDismiss(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    func setupUI() {
        viewHeader.backgroundColor = viewHeader.backgroundColor?.withAlphaComponent(0.5)
        imgTeamLogo.layer.cornerRadius = imgTeamLogo.frame.width / 2
        self.lblTeamName.text = teamDetailsViewModel?.team?.teamName
        if teamDetailsViewModel?.team?.teamLogo != nil {
            self.imgTeamLogo.setImage(with: (teamDetailsViewModel?.team!.teamLogo)!)
        }
        self.lblTeamCountry.text = "Coach: " + (teamDetailsViewModel?.team?.coaches[0].coachName ?? "")
    }
}


