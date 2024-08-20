//
//  MockMangerService.swift
//  GamePlayTests
//
//  Created by eng.omar on 20/08/2024.
//

import XCTest
@testable import GamePlay

final class MockingTests: XCTestCase {

    var mockModel: MockNetworkManager!
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
        mockModel = nil
    }
    func testGetData() {
        mockModel = MockNetworkManager(shouldReturnError: false)
        mockModel.fetchLeagues { leagues, error in
            if let error = error {
                XCTFail(error.localizedDescription)
            } else {
                XCTAssertNotNil(leagues)
                XCTAssertEqual(leagues!.success, 1)
                XCTAssertEqual(leagues!.result[0].leagueKey, 305)
                XCTAssertEqual(leagues!.result[0].leagueName, "Süper Lig")
            }
        }
    }
    func testFetchMockDataFail() {
        mockModel = MockNetworkManager(shouldReturnError: true)
        mockModel.fetchLeagues { leagues, error in
            XCTAssertNotNil(error)
            XCTAssertNil(leagues)
        }
    }
}
