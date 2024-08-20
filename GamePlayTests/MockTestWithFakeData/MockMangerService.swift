//
//  MockMangerService.swift
//  GamePlayTests
//
//  Created by eng.omar on 20/08/2024.
//

import XCTest
@testable import GamePlay

final class MockingTests: XCTestCase {

    var mockObj: MockNetworkManager!
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
        mockObj = nil
    }
    
    func testGetData() {
        mockObj = MockNetworkManager(shouldReturnError: false)
        mockObj.fetchLeagues { leagues, error in
            if let error = error {
                XCTFail(error.localizedDescription)
            } else {
                XCTAssertNotNil(leagues)
                XCTAssertEqual(leagues!.success, 1)
                XCTAssertEqual(leagues!.result[0].leagueKey, 322)
                XCTAssertEqual(leagues!.result[0].leagueName, "Süper Lig")
            }
        }
    }
    
    func testFetchMockDataFail() {
        mockObj = MockNetworkManager(shouldReturnError: true)
        mockObj.fetchLeagues { leagues, error in
            XCTAssertNotNil(error)
            XCTAssertNil(leagues)
        }
    }
}
