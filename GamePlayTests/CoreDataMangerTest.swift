//
//  CoreDataMangerTest.swift
//  GamePlayTests
//
//  Created by eng.omar on 20/08/2024.
//

import XCTest
@testable import GamePlay
import CoreData

final class CoreDataMangerTest: XCTestCase {
    var coreData: CoreDataManager?
    override func setUpWithError() throws {
        coreData = CoreDataManager.shared
        clearCache()
    }

    override func tearDownWithError() throws {
        coreData = nil
    }
    
    func clearCache() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName:"FavList")
        do {
            let leagues = try managedContext.fetch(fetchRequest)
            for league in leagues {
                managedContext.delete(league)
            }
            try managedContext.save()
        } catch let error as NSError {
            print(error)
        }
    }
    

    func testSaveLeague() {
        XCTAssertEqual(coreData?.fetchSavedLeagues().count, 0)
//     var manualLeague: FavList?
        let manualLeague = FavList(context: coreData!.context)

        manualLeague.leagueImg = "image"
        manualLeague.leagueKey = 22
        manualLeague.leagueName = "egyption League"
        manualLeague.leagueURL = ""
        let data = LeaguesResult(favLeague: manualLeague)
        coreData?.saveLeague(data)
        XCTAssertEqual(coreData?.fetchSavedLeagues().count, 2)
        XCTAssertEqual(coreData?.fetchSavedLeagues().first?.leagueName, "egyption League")
    }
    func testFetchSavedLeagues() {
        XCTAssertEqual(coreData?.fetchSavedLeagues().count, 0)
//     var manualLeague: FavList?
        let manualLeague = FavList(context: coreData!.context)

        manualLeague.leagueImg = "image"
        manualLeague.leagueKey = 22
        manualLeague.leagueName = "egyption League"
        manualLeague.leagueURL = ""
        let data = LeaguesResult(favLeague: manualLeague)
        coreData?.saveLeague(data)
        XCTAssertEqual(coreData?.fetchSavedLeagues().count, 2)
        XCTAssertEqual(coreData?.fetchSavedLeagues().first?.leagueName, "egyption League")

    }
    func testRemoveLeague() {
        XCTAssertEqual(coreData?.fetchSavedLeagues().count, 0)
//     var manualLeague: FavList?
        let manualLeague = FavList(context: coreData!.context)

        manualLeague.leagueImg = "image"
        manualLeague.leagueKey = 22
        manualLeague.leagueName = "egyption League"
        manualLeague.leagueURL = ""
        let data = LeaguesResult(favLeague: manualLeague)
        coreData?.saveLeague(data)
        XCTAssertEqual(coreData?.fetchSavedLeagues().count, 2)
        XCTAssertEqual(coreData?.fetchSavedLeagues().first?.leagueName, "egyption League")
        coreData?.removeLeague(leagueKey: 22)
        XCTAssertEqual(coreData?.fetchSavedLeagues().count, 1)
        
    }
    func testIsFavorite() {
        XCTAssertEqual(coreData?.fetchSavedLeagues().count, 0)

          let manualLeague = FavList(context: coreData!.context)
          manualLeague.leagueImg = "image"
          manualLeague.leagueKey = 22
          manualLeague.leagueName = "egyption League"
          manualLeague.leagueURL = ""

          let data = LeaguesResult(favLeague: manualLeague)
          coreData?.saveLeague(data)
          let isFav = coreData?.isFavorite(league: data, arrayOfLeagues: [manualLeague])
          XCTAssertTrue(isFav ?? false, "Expected league to be in favorites but it was not.")
    }

}
