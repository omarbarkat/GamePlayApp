//
//  CoreDataService.swift
//  GamePlay
//
//  Created by eng.omar on 20/08/2024.
//


import CoreData
import UIKit

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {}
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveLeague(_ league: LeaguesResult) {
        let leagueEntity = FavList(context: context)
        leagueEntity.leagueKey = Int32(league.leagueKey)
        leagueEntity.leagueName = league.leagueName
        leagueEntity.leagueImg = league.leagueLogo
        leagueEntity.leagueURL = Converter.convertingImgToStr(img: league.leagueLogo ?? "logo")
        
        do {
            try context.save()
            print("League saved successfully.")
        } catch {
            print("Failed to save league: \(error.localizedDescription)")
        }
    }
    
    func fetchSavedLeagues() -> [FavList] {
        let fetchRequest: NSFetchRequest<FavList> = FavList.fetchRequest()
        
        do {
            let leagues = try context.fetch(fetchRequest)
            return leagues
        } catch {
            print("Failed to fetch leagues: \(error.localizedDescription)")
            return []
        }
    }
    func removeLeague(leagueKey: Int) {
        let fetchRequest: NSFetchRequest<FavList> = FavList.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "leagueKey == %d", leagueKey)
        fetchRequest.fetchLimit = 1

        do {
            let leagues = try context.fetch(fetchRequest)
            if let leagueToRemove = leagues.first {
                context.delete(leagueToRemove)
                try context.save()
                print("League removed successfully.")
            } else {
                print("League not found.")
            }
        } catch {
            print("Failed to remove league: \(error.localizedDescription)")
        }
    }
    func isFavorite(league:LeaguesResult,arrayOfLeagues:[FavList])->Bool{
        var result = false
        for leagueInArray in arrayOfLeagues {
            if (league.leagueName == leagueInArray.leagueName){
                result = true
            }else{
                result = false
            }
        }
        return result
    }
}
