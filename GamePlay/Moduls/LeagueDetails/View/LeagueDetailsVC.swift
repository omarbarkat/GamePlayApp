//
//  LeagueDetailsVC.swift
//  GamePlay
//
//  Created by eng.omar on 16/08/2024.
//

import UIKit

class LeagueDetailsVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.RegisterNib(cell: FirstSectionNibCell.self)
        collectionView.RegisterNib(cell: SecondSectionNibCell.self)
        collectionView.RegisterNib(cell: HomeCollectionViewCell.self)
        collectionView.backgroundColor = collectionView.backgroundColor?.withAlphaComponent(0.9)
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


    }
    

  
    

}
extension LeagueDetailsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstSectionNibCell", for: indexPath) as! FirstSectionNibCell
            cell.FirstBackgroundView.backgroundColor = cell.FirstBackgroundView.backgroundColor?.withAlphaComponent(0.5)
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.borderWidth = 3
            cell.layer.cornerRadius = 15
            return cell

        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondSectionNibCell", for: indexPath) as! SecondSectionNibCell
            cell.secBackgroundView.backgroundColor = cell.secBackgroundView.backgroundColor?.withAlphaComponent(0.2)
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.borderWidth = 3
            cell.layer.cornerRadius = 15

            return cell

        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
            cell.HomebackgroundView.backgroundColor = cell.HomebackgroundView.backgroundColor?.withAlphaComponent(0.2)

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

//    func thirdSection() -> NSCollectionLayoutSection {
//        // Calculate the width to be one-fourth of the screen width
//        let groupWidth = UIScreen.main.bounds.width / 4
//        // Set the height to be one-fourth of the screen height
//        let groupHeight = UIScreen.main.bounds.height / 4
//        
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        
//        // Create the group size with the calculated width and height
//        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(groupWidth), heightDimension: .absolute(groupHeight))
//        
//        // Create the group with horizontal layout and subitems
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//        
//        // Set the spacing between items in the group
//        group.interItemSpacing = .fixed(10) // Adjust the value for the desired spacing
//        
//        // Create the section with the group
//        let section = NSCollectionLayoutSection(group: group)
//        
//        // Enable horizontal scrolling behavior
//        section.orthogonalScrollingBehavior = .continuous
//        
//        // Add content insets to the section (optional)
//        section.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 10, bottom: 5, trailing: 10)
//        
//        return section
//    }

}
