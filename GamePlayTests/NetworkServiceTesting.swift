//
//  NetworkServiceTesting.swift
//  GamePlayTests
//
//  Created by eng.omar on 20/08/2024.
//

import XCTest
@testable import GamePlay
final class NetworkServiceTesting: XCTestCase {
    
    var netwokrking: NetworkService?
    override func setUpWithError() throws {
        netwokrking = NetworkService()
    }
    
    override func tearDownWithError() throws {
        
        netwokrking = nil
        
    }
    
    
    func testNetworking() {
        let expectedObject = XCTestExpectation(description: "waiting api response done..")
        netwokrking?.request(BGConstants.foodball, parameters: APIParameters.normal.paramters) { [weak self] (result: Resultt<LeaguesModel, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                XCTAssertEqual(response.success, 1)
                expectedObject.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
                
            }
            wait(for: [expectedObject],timeout: 10)
            
            
        }
        
    }
    func testNetworkNoURLFailure() throws {
        let expectedObject = XCTestExpectation(description: "waiting api response done..")
        netwokrking?.request("", parameters: APIParameters.normal.paramters) { [weak self] (result: Resultt<LeaguesModel, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                XCTAssertEqual(response.success, 1)
                expectedObject.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            wait(for: [expectedObject],timeout: 10)

        }
    }

}


