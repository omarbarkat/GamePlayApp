//
//  TeamDetailsViewModel.swift
//  GamePlay
//
//  Created by eng.omar on 19/08/2024.
//

import Foundation

class TeamDetailsViewModel {
    var networkService: NetworkService?
    var team: TeamModel?
    var teamID: String
    
    init(teamID: String) {
        networkService = NetworkService()
        self.teamID = teamID
    }
    func getData(completionHandler: @escaping (TeamsResult) -> Void) {
        networkService?.request(BGConstants.foodball, parameters: APIParameters.teamDetails(teamID: teamID).paramters) {(result: Resultt<TeamsResult, Error>) in
            switch result {
               case .success(let response):
                self.team = response.result[0]
                completionHandler(response)
               case .failure(let error):
                   print("Error: \(error)")
               }
        }
    }
}
