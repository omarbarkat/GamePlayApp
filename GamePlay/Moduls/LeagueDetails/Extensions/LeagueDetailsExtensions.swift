//
//  LeagueDetailsExtensions.swift
//  GamePlay
//
//  Created by eng.omar on 19/08/2024.
//

import Foundation
import UIKit

extension LeagueDetailsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return (leagueDetailsViewModel?.arrComingEvents.count)!
        case 1:
            return (leagueDetailsViewModel?.arrLatestResult.count)!
        case 2:
            return (leagueDetailsViewModel?.arrTeams.count)!
        default:
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstSectionNibCell", for: indexPath) as! FirstSectionNibCell
            
            cell.FirstBackgroundView.backgroundColor = cell.FirstBackgroundView.backgroundColor?.withAlphaComponent(0.5)
            let event = leagueDetailsViewModel?.arrComingEvents[indexPath.row]
            cell.lblEventTitle.text = event?.eventStadium
            
            cell.lblFirstTeamName.text = event?.eventHomeTeam
            cell.lblSecTeamName.text = event?.eventAwayTeam
            cell.lblFirstTeamSubName.text = event?.eventAwayTeam
            
//            if event?.homeTeamLogo != nil {
//
//            }
            cell.imgFirstTeamLogo.setImage(with: event?.homeTeamLogo! ?? "")
            cell.imgSecTeamLogo.setImage(with: event?.awayTeamLogo! ?? "")
            cell.lblMatchDate.text = event?.eventDate
            cell.lblMatchTime.text = event?.eventTime
            cell.lblEventSubtitle.text = event?.countryName
            cell.lblSecTeamSubName.text = event?.eventPenaltyResult
            
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.borderWidth = 3
            cell.layer.cornerRadius = 15
            return cell

        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondSectionNibCell", for: indexPath) as! SecondSectionNibCell
            let latestResult = leagueDetailsViewModel?.arrLatestResult[indexPath.row]
            cell.secBackgroundView.backgroundColor = cell.secBackgroundView.backgroundColor?.withAlphaComponent(0.2)
            cell.lblLiftTeamName.text = latestResult?.eventHomeTeam
            cell.lblReightTameName.text = latestResult?.eventAwayTeam
            cell.lblMatchResult.text = latestResult?.eventFinalResult
            if latestResult?.homeTeamLogo != nil {
                cell.imgLiftTeamLogo.setImage(with: latestResult?.homeTeamLogo! ?? "")
            }
           
            if latestResult?.awayTeamLogo != nil {
                            cell.imgReightTeamLogo.setImage(with: latestResult?.awayTeamLogo! ?? "")

            }
            
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.borderWidth = 3
            cell.layer.cornerRadius = 15

            return cell

        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
            let team = leagueDetailsViewModel?.arrTeams[indexPath.row]
            cell.HomebackgroundView.backgroundColor = cell.HomebackgroundView.backgroundColor?.withAlphaComponent(0.2)
            cell.lblSportName.text = team?.teamName
            cell.imgSportPhoto.setImage(with: team?.imgUrl ?? "")
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.borderWidth = 3
            cell.layer.cornerRadius = 15
            return cell

        default:
            print("defualt")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
          
            return cell

        }
        
        
//        return cell
    }
    
    func firstSection() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.79), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets =   NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 5, bottom: 5, trailing: 0)

        section.visibleItemsInvalidationHandler = { (items, offset, environment) in
        items.forEach { item in
        let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
        let minScale: CGFloat = 0.8
        let maxScale: CGFloat = 1.0
        let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
        item.transform = CGAffineTransform(scaleX: scale, y: scale)
        }}
        return section
    }
    func secondSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Calculate the width to be screen width minus 20 points
        let groupWidth = UIScreen.main.bounds.width
        // Set the height to be one-fourth of the screen height
        let groupHeight = UIScreen.main.bounds.height / 6
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(groupWidth), heightDimension: .absolute(groupHeight))
        
        // Vertical group layout
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 10) // Center the group with padding
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 0, bottom: 5, trailing: 0)
        return section
    }



    func thirdSection() -> NSCollectionLayoutSection {
        // Calculate the width to be one-fourth of the screen width
        let groupWidth = UIScreen.main.bounds.width / 2.7
        // Set the height to be one-fourth of the screen height
        let groupHeight = UIScreen.main.bounds.height / 5
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(groupWidth), heightDimension: .absolute(groupHeight))
        
        // Horizontal group layout
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
//        group.interItemSpacing = .fixed(10)
        // Adjust the value for the desired spacing

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous // Horizontal scrolling behavior
        section.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 0, bottom: 5, trailing: 0)
        
        return section
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        naviToTeamDetails(index: indexPath.row)
    }

}
