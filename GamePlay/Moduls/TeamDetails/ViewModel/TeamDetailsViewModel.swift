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
        let url = "https://apiv2.allsportsapi.com/football/?met=Teams&teamId=175&APIkey=781caa8a35913d04b7a8f150114a3dddba894c05c380891b3a55100c60d9afe5"
        networkService?.request(url, parameters: APIParameters.teamDetails(teamID: teamID).paramters) {(result: Resultt<TeamsResult, Error>) in
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
