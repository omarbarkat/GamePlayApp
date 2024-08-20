//
//  FootballModel.swift
//  GamePlay
//
//  Created by eng.omar on 13/08/2024.
//

import Foundation

struct LeaguesModel: Codable {
    let success: Int
    let result: [LeaguesResult]
}

struct LeaguesResult: Codable {
    let leagueKey: Int
    let leagueName: String
    let leagueLogo : String?

    init(favLeague: FavList) {
        self.leagueKey = Int(favLeague.leagueKey)
        
        self.leagueLogo = favLeague.leagueImg ?? ""
        self.leagueName = favLeague.leagueName ?? ""
    }
    enum CodingKeys: String, CodingKey {
        case leagueKey = "league_key"
        case leagueName = "league_name"
        case leagueLogo = "league_logo"
    }
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.leagueKey = try container.decode(Int.self, forKey: .leagueKey)
        self.leagueName = try container.decode(String.self, forKey: .leagueName)
        self.leagueLogo = try container.decodeIfPresent(String.self, forKey: .leagueLogo)
    }
}
