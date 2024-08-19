//
//  LeagueDetailsVC.swift
//  GamePlay
//
//  Created by eng.omar on 16/08/2024.
//

import UIKit

class LeagueDetailsVC: UIViewController {
    var arrEvent: [EventModel] = []
    var leagueDetailsViewModel: LeaguesDetailsViewModel?
    var leaguesViewModel: LeaguesViewModel?
    var leagueID: String?
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        leaguesViewModel = LeaguesViewModel(sport: .football)
//        leagueDetailsViewModel = LeaguesDetailsViewModel()
      
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.RegisterNib(cell: FirstSectionNibCell.self)
        collectionView.RegisterNib(cell: SecondSectionNibCell.self)
        collectionView.RegisterNib(cell: HomeCollectionViewCell.self)
        collectionView.backgroundColor = collectionView.backgroundColor?.withAlphaComponent(0.9)
        let compLayout = UICollectionViewCompositionalLayout{
            (index , enviroment) in
            if index == 0 {
                return self.firstSection()
            }
            else if index == 1{
                return self.secondSection()
            }
            else {
                return self.thirdSection()

            }
        }
        collectionView.setCollectionViewLayout(compLayout, animated: true)
        leagueDetailsViewModel?.getData(apiParameter: APIParameters.comingEvent(leagueID: (leagueDetailsViewModel?.leagueID)!), isComingEvent: true, completionHandler: { response in
            print("ok")
            DispatchQueue.main.async {
                self.collectionView.reloadData()

            }
        })
        
        leagueDetailsViewModel?.getData(apiParameter: APIParameters.latestEvent(leagueID: (leagueDetailsViewModel?.leagueID )!), isComingEvent: false, completionHandler: { response in
            DispatchQueue.main.async {
                self.collectionView.reloadData()

            }
        })


    }
    
    func naviToTeamDetails(index: Int) {
        let vc = storyboard?.instantiateViewController(identifier: "TeamDetailsVC") as! TeamDetailsVC
        vc.modalPresentationStyle = .fullScreen
        vc.teamDetailsViewModel = TeamDetailsViewModel(teamID: "\(leagueDetailsViewModel?.arrTeams[index].teamKey ?? "175")" )
        present(vc, animated: true)
    }
  
    

}
