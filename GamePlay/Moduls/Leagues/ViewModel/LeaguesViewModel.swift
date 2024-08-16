//
//  FootballViewModel.swift
//  GamePlay
//
//  Created by eng.omar on 14/08/2024.
//

import Foundation

class LeaguesViewModel {
    
    var networkService: NetworkService?
    var url: String = ""
    var sporype:Sport
    var arrSport:[Any]=[]
    
    init(sport:Sport) {
        sporype=sport
        networkService = NetworkService()
    }
//    var getFootballLeagues: ( ()-> Void)
    func getData(completionHandler: @escaping (Any)-> Void) {
        var str = ""
        typealias sp = LeaguesModel
        switch sporype{
        case .football:
            str="https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=781caa8a35913d04b7a8f150114a3dddba894c05c380891b3a55100c60d9afe5"
        case .basketball:
            str="https://apiv2.allsportsapi.com/basketball/?met=Leagues&APIkey=781caa8a35913d04b7a8f150114a3dddba894c05c380891b3a55100c60d9afe5"
            typealias sp = BasketballModel
        case .cricket:
            str = "https://apiv2.allsportsapi.com/cricket/?met=Leagues&APIkey=781caa8a35913d04b7a8f150114a3dddba894c05c380891b3a55100c60d9afe5"
            typealias sp = CricketModel
        case .tennis:
            str = "https://apiv2.allsportsapi.com/tennis/?met=Leagues&APIkey=781caa8a35913d04b7a8f150114a3dddba894c05c380891b3a55100c60d9afe5"
            typealias sp = TennisModel
      
        }
        networkService?.request(str) {(result: Resultt<sp, Error>) in
            print(result)
            switch result {
                
               case .success(let response):
                   print("User: \(response)")
                self.arrSport = response.result
                completionHandler(response)
               case .failure(let error):
                   print("Error: \(error)")
               }
        }
    }
}
enum Sport:String {
    case football = "football"
    case basketball = "basketball"
    case tennis = "tennis"
    case cricket = "cricket"
}
