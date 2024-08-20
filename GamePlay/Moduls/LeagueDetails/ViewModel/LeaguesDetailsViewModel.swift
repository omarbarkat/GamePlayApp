//
//  LeaguesDetailsViewModel.swift
//  GamePlay
//
//  Created by eng.omar on 17/08/2024.
//

import Foundation

class LeaguesDetailsViewModel: LeaguesDetailsViewModelPorotocol {
    var networkService: NetworkServiceProtocol
    var arrComingEvents: [EventModel] = []
    var arrLatestResult: [EventModel] = []
    var setTeams: Set<TeamsModel> = []
    var arrTeams: [TeamsModel] = []
    var onNavigationToTeamDetails: (() -> Void)?
    var leagueID: String
    var isFav: Bool = true
    var currentLeague: LeaguesResult

    init(leagueID: String, currentLeague: LeaguesResult, networkService: NetworkServiceProtocol = NetworkService()) {
        self.leagueID = leagueID
        self.currentLeague = currentLeague
        self.networkService = networkService
    }

    init(leagueID: String, currentLeague: FavList, networkService: NetworkServiceProtocol = NetworkService()) {
        self.leagueID = leagueID
        self.currentLeague = LeaguesResult(favLeague: currentLeague)
        self.networkService = networkService
    }

    func getData(apiParameter: APIParameters, isComingEvent: Bool, completionHandler: @escaping (ComingEventsModel) -> Void) {
        networkService.request(BGConstants.foodball, parameters: apiParameter.paramters) { [weak self] (result: Resultt<ComingEventsModel, Error>) in
            guard let self = self else { return }

            switch result {
            case .success(let response):
                let events = response.result
                self.processEvents(events, isComingEvent: isComingEvent)
                completionHandler(response)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }

    private func processEvents(_ events: [EventModel], isComingEvent: Bool) {
        if isComingEvent {
            arrComingEvents.append(contentsOf: events)
        } else {
            arrLatestResult.append(contentsOf: events)
        }
        
        for item in events {
            let homeTeam = TeamsModel(imgUrl: item.homeTeamLogo ?? "defulatFootball", teamKey: "\(item.homeTeamKey)", teamName: item.eventHomeTeam)
            let awayTeam = TeamsModel(imgUrl: item.awayTeamLogo ?? "defulatFootball", teamKey: "\(item.awayTeamKey)", teamName: item.eventAwayTeam)
            setTeams.insert(homeTeam)
            setTeams.insert(awayTeam)
        }
        
        arrTeams = Array(setTeams)
    }

    func showTeamDetails() {
        onNavigationToTeamDetails?()
    }
}
