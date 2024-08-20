//
//  LeaguesDetailsViewModelTests.swift
//  GamePlayTests
//
//  Created by eng.omar on 20/08/2024.
//

import XCTest
@testable import GamePlay
import CoreData


final class LeaguesDetailsViewModelTests: XCTestCase {

    var viewModel: LeaguesDetailsViewModel?
    var coreData: CoreDataManager?

    override func setUpWithError() throws {
        coreData = CoreDataManager.shared
        let leagueID = "123"
        let manualLeague = FavList(context: coreData!.context)
               manualLeague.leagueImg = "image"
               manualLeague.leagueKey = 22
               manualLeague.leagueName = "egyption League"
               manualLeague.leagueURL = ""

        viewModel = LeaguesDetailsViewModel(leagueID: leagueID, currentLeague: manualLeague)
     
    }

    override func tearDownWithError() throws {
        viewModel = nil
        
    }
    func testGetData() {
    let expectation = XCTestExpectation(description: "check geting data...")
        viewModel?.getData(apiParameter: APIParameters.comingEvent(leagueID: "175"), isComingEvent: true, completionHandler: { response in
            XCTAssertNotNil(response)
            expectation.fulfill()

        })
        
        wait(for: [expectation],timeout: 10)

    }
    

    func testShowTeamDetails() {
        var isNavigationTriggered = false
      viewModel?.onNavigationToTeamDetails = {
            isNavigationTriggered = true
        }
        viewModel?.showTeamDetails()
        XCTAssertTrue(isNavigationTriggered, "failure in navigation")
    }
}
