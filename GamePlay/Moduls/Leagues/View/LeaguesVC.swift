//
//  FootballLeaguesVC.swift
//  GamePlay
//
//  Created by eng.omar on 14/08/2024.
//

import UIKit

class LeaguesVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var leaguesViewModel: LeaguesViewModel?
    @IBOutlet weak var headerView: UIView!
    {
        didSet {
            headerView.backgroundColor = headerView.backgroundColor?.withAlphaComponent(0.3)
            headerView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.RegisterNib(cell: LeaguesCollectionViewCell.self)
        
        if leaguesViewModel == nil {
            leaguesViewModel = LeaguesViewModel(sport: .football, dataSourceManger: .coreData)
            
        }
        
        

      
        leaguesViewModel?.getData(completionHandler: { response in
            self.collectionView.reloadData()
        })

    }
    override func viewWillAppear(_ animated: Bool) {
        self.collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "onNavigationToLeagueDetails" {
            if let vc = segue.destination as? LeagueDetailsVC {
                if let indexPath = collectionView.indexPathsForSelectedItems?.first{
                    if leaguesViewModel?.dataSourceManger == .coreData {
                        let selectedLeague = leaguesViewModel?.arrFav[indexPath.row]
                        vc.leagueDetailsViewModel=LeaguesDetailsViewModel(leagueID: "\(selectedLeague!.leagueKey)", currentLeague: selectedLeague!)
                    }else {
                        let selectedLeague = leaguesViewModel?.arrSport[indexPath.row] as? LeaguesResult
                        vc.leagueDetailsViewModel=LeaguesDetailsViewModel(leagueID: "\(selectedLeague!.leagueKey)", currentLeague: selectedLeague!)
                    }
                   
                }
            }
        }
    }
}


