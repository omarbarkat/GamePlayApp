//
//  LeaguesCollectionViewUISetup.swift
//  GamePlay
//
//  Created by eng.omar on 16/08/2024.
//

import Foundation
import UIKit

extension LeaguesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return leaguesViewModel?.arrSport.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LeaguesCollectionViewCell", for: indexPath) as! LeaguesCollectionViewCell
        switch leaguesViewModel?.sporype {
        case .football:
            let obj=leaguesViewModel?.arrSport[indexPath.row] as! LeaguesResult
            cell.lblLeagueName.text = obj.leagueName
            cell.imgLeaguePhoto.contentMode = .scaleToFill

            if obj.countryLogo != nil {
                cell.imgLeaguePhoto.setImage(with: obj.countryLogo!)

            }else {
                cell.imgLeaguePhoto.image = UIImage(named: "defulatFootball")!
            }
        case .basketball:
            let obj=leaguesViewModel?.arrSport[indexPath.row] as! LeaguesResult
            cell.lblLeagueName.text = obj.leagueName
            cell.imgLeaguePhoto.contentMode = .scaleToFill
            if obj.countryLogo != nil {
                cell.imgLeaguePhoto.setImage(with: obj.leagueLogo!)

            }else {
                cell.imgLeaguePhoto.image = UIImage(named: "basketball1")!
            }
        case .tennis:
            let obj=leaguesViewModel?.arrSport[indexPath.row] as! LeaguesResult
            cell.lblLeagueName.text = obj.leagueName
            if obj.countryLogo != nil {
                cell.imgLeaguePhoto.setImage(with: obj.leagueLogo!)

            }else {
                cell.imgLeaguePhoto.image = UIImage(named: "tennis")!
            }
        case .cricket:
            let obj=leaguesViewModel?.arrSport[indexPath.row] as! LeaguesResult
            cell.lblLeagueName.text = obj.leagueName
            if obj.countryLogo != nil {
                cell.imgLeaguePhoto.setImage(with: obj.leagueLogo!)

            }else {
                cell.imgLeaguePhoto.image = UIImage(named: "cricketDef")!
            }
        case .none:
            break
        }
        cell.imgLeaguePhoto.layer.cornerRadius = 15
        cell.footballBackgroundView.backgroundColor = cell.footballBackgroundView.backgroundColor?.withAlphaComponent(0.2)
        cell.layer.cornerRadius = 15

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 20, height: collectionView.bounds.height / 4.5 )
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "onNavigationToLeagueDetails", sender: self)


    }
    
}

