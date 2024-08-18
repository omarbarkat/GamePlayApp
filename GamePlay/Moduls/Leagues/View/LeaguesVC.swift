//
//  FootballLeaguesVC.swift
//  GamePlay
//
//  Created by eng.omar on 14/08/2024.
//

import UIKit
import Kingfisher

class LeaguesVC: UIViewController {
    
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
        leaguesViewModel?.getData(completionHandler: { response in
            
            self.collectionView.reloadData()
        })

    }
    
    func naviToLeagueDetails() {
        leaguesViewModel?.onNavigationToLeagueDetails = { [weak self] in
            let vc = self?.storyboard?.instantiateViewController(withIdentifier: "LeagueDetailsVC") as! LeagueDetailsVC
            self?.navigationController?.pushViewController(vc, animated: true)
            self?.leaguesViewModel?.showLeagueDetails()
            
        }
    }
 

}
