//
//  LeaguesTesting.swift
//  GamePlayTests
//
//  Created by eng.omar on 20/08/2024.
//

import XCTest
@testable import GamePlay

final class LeaguesTesting: XCTestCase {

    var viewModel: LeaguesViewModel!
    override func setUpWithError() throws {
        viewModel = LeaguesViewModel(sport: .football, dataSourceManger: .api)
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    func testGetData() {
        let expectation = XCTestExpectation(description: "adding data from api response")
        viewModel.getData { response in
            XCTAssertNotNil(response)
            expectation.fulfill()
        }
        wait(for: [expectation],timeout: 10)
    }
    func testGetDataFromAPI() {
        let expectation = XCTestExpectation(description: "adding data from api response")
        viewModel.getDataFromAPI { response in
            XCTAssertNotNil(response)
            expectation.fulfill()
        }
        wait(for: [expectation],timeout: 10)

    }
    func testGetDataFromCoreData() {
        _ = XCTestExpectation(description: "adding data from CoreData")
        viewModel.getDataFromCoreData { response in
            XCTAssertNotNil(response)
        }
    }    
    func testShowLeagueDetails() {
          var isNavigationTriggered = false
        viewModel?.onNavigationToLeagueDetails = {
              isNavigationTriggered = true
          }
          viewModel?.showLeagueDetails()
          XCTAssertTrue(isNavigationTriggered, "failure in navigation")
      }
 


}
