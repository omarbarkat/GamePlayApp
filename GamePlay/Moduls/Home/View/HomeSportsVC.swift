//
//  ViewController.swift
//  GamePlay
//
//  Created by eng.omar on 13/08/2024.
//

import UIKit

class HomeSportsVC: UIViewController {

    var football: LeaguesViewModel?
    var homeViewModel: HomeViewModel?
    var networkSevice: NetworkService?
    var arrHomeData: [HomeModel] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.RegisterNib(cell: HomeCollectionViewCell.self)
        networkSevice = NetworkService()
        homeViewModel = HomeViewModel()
        arrHomeData = (homeViewModel?.getHomeData())!

    }
    func naviToFootball(flag:Int) {
        homeViewModel?.onNavigationToFootball = { [weak self]  in
            let vc = self?.storyboard?.instantiateViewController(withIdentifier: "FootballLeaguesVC") as! LeaguesVC
            switch flag {
            case 0:
                vc.leaguesViewModel = LeaguesViewModel(sport: .football, dataSourceManger: .api)
            case 1:
                vc.leaguesViewModel = LeaguesViewModel(sport: .basketball, dataSourceManger: .api)
            case 2:
                vc.leaguesViewModel = LeaguesViewModel(sport: .cricket, dataSourceManger: .api)
            case 3:
                vc.leaguesViewModel = LeaguesViewModel(sport: .tennis, dataSourceManger: .api)

            default:
                
                print("")
            }
//            vc.leaguesViewModel?.dataSourceManger = .api
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        homeViewModel?.showFootballLeague()
    }

}


