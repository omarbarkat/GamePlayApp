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
        if leaguesViewModel?.dataSourceManger == .coreData {
            return leaguesViewModel?.arrFav.count ?? 0
        } else {
                    return leaguesViewModel?.arrSport.count ?? 0
        }
    }
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LeaguesCollectionViewCell", for: indexPath) as! LeaguesCollectionViewCell
        
        if leaguesViewModel?.dataSourceManger == .coreData {
            configureCell(cell, with: leaguesViewModel?.arrFav[indexPath.row])
        } else {
            configureCell(cell, with: leaguesViewModel?.arrSport[indexPath.row] as? LeaguesResult)
        }
        return cell
    }
    private func configureCell(_ cell: LeaguesCollectionViewCell, with league: FavList?) {
        guard let league = league else { return }
        cell.lblLeagueName.text = league.leagueName
        configureImage(cell.imgLeaguePhoto, with: league.leagueImg, defaultImageName: "defaultImage")
    }
    private func configureCell(_ cell: LeaguesCollectionViewCell, with league: LeaguesResult?) {
        guard let league = league else { return }
        cell.lblLeagueName.text = league.leagueName
        let defaultImageName: String
        switch leaguesViewModel?.sporype {
        case .football:
            defaultImageName = "defulatFootball"
        case .basketball:
            defaultImageName = "basketball1"
        case .tennis:
            defaultImageName = "tennis"
        case .cricket:
            defaultImageName = "cricketDef"
        case .none:
            defaultImageName = "defaultImage"
        }
        cell.layer.cornerRadius = 10
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 2
        configureImage(cell.imgLeaguePhoto, with: league.leagueLogo, defaultImageName: defaultImageName)
    }
    private func configureImage(_ imageView: UIImageView, with url: String?, defaultImageName: String) {
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 15
        if let url = url {
            imageView.setImage(with: url)
        } else {
            imageView.image = UIImage(named: defaultImageName)
        }
        imageView.layer.cornerRadius = 15
        imageView.superview?.backgroundColor = imageView.superview?.backgroundColor?.withAlphaComponent(0.2)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 20, height: collectionView.bounds.height / 4.5 )
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Connectivity.shared.check { [weak self] connection in
            if connection {
                self?.performSegue(withIdentifier: "onNavigationToLeagueDetails", sender: self)
            }else {
                self?.alert(msg: "Please check your internet connection and try again.")

            }

        }
    }
}

