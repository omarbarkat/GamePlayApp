//
//  TeamDetails.swift
//  GamePlayTests
//
//  Created by eng.omar on 20/08/2024.
//

import XCTest
@testable import GamePlay

final class TeamDetails: XCTestCase {
    
    var viewModel: TeamDetailsViewModel!
    override func setUpWithError() throws {
        viewModel = TeamDetailsViewModel(teamID: "4")
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testGetData() {
        let expectation = XCTestExpectation(description: "adding team data")
        viewModel.getData { response in
            XCTAssertNotNil(response)
            expectation.fulfill()
        }
        wait(for: [expectation],timeout: 10)

    }


    
}
