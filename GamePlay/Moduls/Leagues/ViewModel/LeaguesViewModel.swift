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
            str = BGConstants.foodball
        case .basketball:
            str = BGConstants.basketball
            typealias sp = BasketballModel
        case .cricket:
            str = BGConstants.cricket

            typealias sp = CricketModel
        case .tennis:
            str = BGConstants.tennis
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
