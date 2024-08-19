//
//  FootballViewModel.swift
//  GamePlay
//
//  Created by eng.omar on 14/08/2024.
//

import Foundation

protocol LeaguesViewModelProtocol {
    func showLeagueDetails()
}
class LeaguesViewModel: LeaguesViewModelProtocol {
    
    var networkService: NetworkService?
    var url: String = ""
    var sporype: Sport
    var arrSport: [Any]=[]
    var onNavigationToLeagueDetails: (() -> Void)?
    var dataSourceManger: DataSourceManger
    var arrFav: [FavList] = []

    init(sport: Sport,dataSourceManger: DataSourceManger ) {
        sporype = sport
        networkService = NetworkService()
        self.dataSourceManger = dataSourceManger
    }
    func getData(completionHandler: @escaping (Any)-> Void ) {
        switch dataSourceManger {
        case .coreData:
            getDataFromCoreData(completionHandler: completionHandler)
        case .api:
            getDataFromAPI(completionHandler: completionHandler)
        }
    }
    
    func getDataFromAPI(completionHandler: @escaping (Any)-> Void) {
        var str = ""
        typealias sp = LeaguesModel
        switch sporype{
        case .football:
            str="https://apiv2.allsportsapi.com/football/"
        case .basketball:
            str="https://apiv2.allsportsapi.com/basketball/"
            typealias sp = BasketballModel
        case .cricket:
            str = "https://apiv2.allsportsapi.com/cricket/"
            typealias sp = CricketModel
        case .tennis:
            str = "https://apiv2.allsportsapi.com/tennis/"
            typealias sp = TennisModel
        }
        networkService?.request(str, parameters: APIParameters.normal.paramters) {(result: Resultt<sp, Error>) in
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
    
    func getDataFromCoreData(completionHandler: @escaping (Any)-> Void ) {
        // fetch data from core data
        arrFav = CoreDataManager.shared.fetchSavedLeagues()
        
        
    }
    
    func showLeagueDetails() {
        onNavigationToLeagueDetails?()
    }
}
enum Sport:String {
    case football = "football"
    case basketball = "basketball"
    case tennis = "tennis"
    case cricket = "cricket"
}
