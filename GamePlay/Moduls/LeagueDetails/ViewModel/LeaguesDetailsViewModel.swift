//
//  LeaguesDetailsViewModel.swift
//  GamePlay
//
//  Created by eng.omar on 17/08/2024.
//

import Foundation

class LeaguesDetailsViewModel {
    var networkService: NetworkService?
    var arrComingEvents:[EventModel] = []
    var arrLatestResult:[EventModel] = []
    var setTeams :Set<TeamsModel> = []
    var arrTeams:[TeamsModel] = []
    var onNavigationToTeamDetails: (() -> Void)?

    
    
    var leagueID: String

//    init() {
//        networkService = NetworkService()
////        self.leagueID = leagueID
//    } 
    init(leagueID:String) {
        networkService = NetworkService()
        self.leagueID = leagueID
    }
    
    func getData(apiParameter: APIParameters,isComingEvent:Bool, completionHandler: @escaping (ComingEventsModel) -> Void) {

       let url = "https://apiv2.allsportsapi.com/football"
       networkService?.request(url, parameters: apiParameter.paramters) {(result: Resultt<ComingEventsModel, Error>) in
           print(result)
           switch result {
               
              case .success(let response):
                  print("User: \(response)")
               if isComingEvent {
                   self.arrComingEvents.append(contentsOf: response.result)
                   
                   
                   for item in self.arrComingEvents{
                       let obj = TeamsModel(imgUrl: item.homeTeamLogo ?? "defulatFootball", teamKey: "\(item.homeTeamKey)", teamName: item.eventHomeTeam)
                       let obj2 = TeamsModel(imgUrl: item.awayTeamLogo ?? "defulatFootball", teamKey: "\(item.awayTeamKey)", teamName: item.eventAwayTeam)
                       self.setTeams.insert(obj)
                       self.setTeams.insert(obj2)
                       print(self.setTeams.count)
                   }
                   self.arrTeams = Array(self.setTeams)
                   

               }else {
                   self.arrLatestResult.append(contentsOf: response.result)

                   for item in self.arrLatestResult{
                       let obj = TeamsModel(imgUrl: item.homeTeamLogo ?? "defulatFootball", teamKey: "\(item.homeTeamKey)", teamName: item.eventHomeTeam)
                       let obj2 = TeamsModel(imgUrl: item.awayTeamLogo ?? "defulatFootball", teamKey: "\(item.awayTeamKey)", teamName: item.eventAwayTeam)
                       self.setTeams.insert(obj)
                       self.setTeams.insert(obj2)
                       print(self.setTeams.count)
                   }
                   
                   
               }
               print(self.arrComingEvents)
               completionHandler(response)
              case .failure(let error):
                  print("Error: \(error)")
              }
       }
    }
    func showTeamDetails() {
        onNavigationToTeamDetails?()
    }
  
}
