//
//  Extensions.swift
//  GamePlay
//
//  Created by eng.omar on 19/08/2024.
//

import Foundation
import UIKit

extension TeamDetailsVC: UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamDetailsViewModel?.team?.players.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerNibCell", for: indexPath) as! PlayerNibCell
//        let teamINFO = teamDetailsViewModel?.team
        let player = teamDetailsViewModel?.team?.players[indexPath.row]
        cell.lblPlayerName.text = (player?.playerNumber ?? "0") + " " + (player?.playerName ?? "omar")
        cell.lblPlayerPosition.text = player?.playerType.rawValue
        if player?.playerImage != nil {
            cell.imgPlayerPhoto.setImage(with: (player?.playerImage)!)
        }
        

        
        // cell Configration
        cell.ViewBackground.backgroundColor = cell.ViewBackground.backgroundColor?.withAlphaComponent(0.4)
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 10
        
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 20, height: collectionView.bounds.height / 5)
    }
    
    
}

