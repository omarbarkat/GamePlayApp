//
//  ViewController.swift
//  GamePlay
//
//  Created by eng.omar on 13/08/2024.
//

import UIKit

class HomeSportsVC: UIViewController {

//    var data: DataParser?
    var homeViewModel: HomeViewModel?
    var networkSevice: NetworkService?
    var arrHomeData: [HomeModel] = []
    @IBOutlet weak var headerView: UICollectionReusableView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.RegisterNib(cell: HomeCollectionViewCell.self)
        networkSevice = NetworkService()
        homeViewModel = HomeViewModel()
        arrHomeData = (homeViewModel?.getHomeData())!
        print(arrHomeData)
        networkSevice?.request("https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=781caa8a35913d04b7a8f150114a3dddba894c05c380891b3a55100c60d9afe5") {(result: Resultt<FootballModel, Error>) in
            
            switch result {
               case .success(let response):
                   print("User: \(response)")
               case .failure(let error):
                   print("Error: \(error)")
               }
        }
        
//        networkSevice?.getData()

    }


}
extension HomeSportsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        let homeData = arrHomeData[indexPath.row]
        cell.imgSportPhoto.image = UIImage(named: homeData.image)
        cell.lblSportName.text = homeData.title
//        cell.HomebackgroundView.layer.opacity = 0.8
        cell.HomebackgroundView.backgroundColor = cell.HomebackgroundView.backgroundColor?.withAlphaComponent(0.2)
        cell.layer.cornerRadius = 10
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowRadius = 10
        cell.layer.shadowColor = UIColor.gray.cgColor


        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow: CGFloat = 2
        let spacingBetweenCells: CGFloat = 10
        
        let totalSpacing = (2 * spacingBetweenCells) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
        let width = (collectionView.bounds.width - totalSpacing) / numberOfItemsPerRow
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}

