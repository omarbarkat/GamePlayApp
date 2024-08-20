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
//    var isFav = true
    @IBOutlet weak var btnAddToFav: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.RegisterNib(cell: FirstSectionNibCell.self)
        collectionView.RegisterNib(cell: SecondSectionNibCell.self)
        collectionView.RegisterNib(cell: HomeCollectionViewCell.self)
        collectionView.backgroundColor = collectionView.backgroundColor?.withAlphaComponent(0.9)
        addFavBTN()
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
    
    //Actions:
    func addFavBTN() {
        let isFav = CoreDataManager.shared.isFavorite(league: leagueDetailsViewModel!.currentLeague, arrayOfLeagues: CoreDataManager.shared.fetchSavedLeagues())
        
        let addToFav =  UIBarButtonItem(
            image: isFav ? UIImage(systemName: "star.fill") : UIImage(systemName: "star"),
            style: .plain,
            target: self,
            action: #selector(addToFavorites)
        )
        
        navigationItem.rightBarButtonItem = addToFav
    }
    @objc func addToFavorites(){
        let isFav = CoreDataManager.shared.isFavorite(
               league: leagueDetailsViewModel!.currentLeague,
               arrayOfLeagues: CoreDataManager.shared.fetchSavedLeagues())
        
        if isFav{
            CoreDataManager.shared.removeLeague(leagueKey: leagueDetailsViewModel!.currentLeague.leagueKey)
            Alert(msg: "League removed from favorite list")
        }else{
                CoreDataManager.shared.saveLeague(leagueDetailsViewModel!.currentLeague)
            Alert(msg: "League Added from favorite list")

            }
        NotificationCenter.default.post(name: NSNotification.Name("FavoritesUpdated"), object: nil)

        addFavBTN()
        }
      
    func naviToTeamDetails(index: Int) {
        let vc = storyboard?.instantiateViewController(identifier: "TeamDetailsVC") as! TeamDetailsVC
        vc.modalPresentationStyle = .fullScreen
        vc.teamDetailsViewModel = TeamDetailsViewModel(teamID: "\(leagueDetailsViewModel?.arrTeams[index].teamKey ?? "175")" )
        present(vc, animated: true)
    }
    func Alert(msg: String){
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert,animated: true)
    }
}
