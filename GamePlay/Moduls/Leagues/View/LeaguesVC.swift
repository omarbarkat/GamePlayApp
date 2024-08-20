//
//  FootballLeaguesVC.swift
//  GamePlay
//
//  Created by eng.omar on 14/08/2024.
//

import UIKit

class LeaguesVC: UIViewController {
    //Outlets:
    @IBOutlet weak var imgEmptyPhoto: UIImageView!
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
        NotificationCenter.default.addObserver(self, selector: #selector(updateFavorites), name: NSNotification.Name("FavoritesUpdated"), object: nil)
     
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
 
    @objc func updateFavorites() {
        loadFavorites()
    }
    func loadFavorites() {
        self.leaguesViewModel?.arrFav = CoreDataManager.shared.fetchSavedLeagues()
        self.collectionView.reloadData()
        if leaguesViewModel?.arrFav.isEmpty ?? true {
                  imgEmptyPhoto.isHidden = false
                  imgEmptyPhoto.image = UIImage(named: "error404")
              } else {
                  imgEmptyPhoto.isHidden = true
              }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "onNavigationToLeagueDetails" {
            if !NetworkChecking.shared.isConnected {
                if let vc = segue.destination as? LeagueDetailsVC {
                    if let indexPath = collectionView.indexPathsForSelectedItems?.first {
                        if leaguesViewModel?.dataSourceManger == .coreData {
                            let selectedLeague = leaguesViewModel?.arrFav[indexPath.row]
                            vc.leagueDetailsViewModel = LeaguesDetailsViewModel(leagueID: "\(selectedLeague!.leagueKey)", currentLeague: selectedLeague!)
                        } else {
                            let selectedLeague = leaguesViewModel?.arrSport[indexPath.row] as? LeaguesResult
                            vc.leagueDetailsViewModel = LeaguesDetailsViewModel(leagueID: "\(selectedLeague!.leagueKey)", currentLeague: selectedLeague!)
                        }
                    }
                }
            } else {
                alert(msg: "Please check your internet connection and try again.")
                return
            }
        }
    }
    func alert(msg: String) {
        let alert = UIAlertController(title: "No Internet Connection!", message: msg, preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Dismiss", style: .default)
        alert.addAction(dismiss)
        present(alert, animated: true)
    }
    
}


