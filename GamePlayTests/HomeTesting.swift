//
//  HomeTesting.swift
//  GamePlayTests
//
//  Created by eng.omar on 20/08/2024.
//

import XCTest
@testable import GamePlay
final class HomeTesting: XCTestCase {
    var viewModel: HomeViewModel!
    override func setUpWithError() throws {
        viewModel = HomeViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testShowLeagueDetails() {
          var isNavigationTriggered = false
        viewModel?.onNavigationToFootball = {
              isNavigationTriggered = true
          }
        viewModel?.showFootballLeague()
          XCTAssertTrue(isNavigationTriggered, "failure in navigation")
      }

}
