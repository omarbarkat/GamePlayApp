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
//    let countryKey: Int?
//    let countryName: String?
    let leagueLogo : String?
//        countryLogo: String?

    init(favLeague: FavList) {
        self.leagueKey = Int(favLeague.leagueKey)
        
        self.leagueLogo = favLeague.leagueImg ?? ""
        self.leagueName = favLeague.leagueName!
        
    }
    enum CodingKeys: String, CodingKey {
        case leagueKey = "league_key"
        case leagueName = "league_name"
//        case countryKey = "country_key"
//        case countryName = "country_name"
        case leagueLogo = "league_logo"
//        case countryLogo = "country_logo"
    }
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.leagueKey = try container.decode(Int.self, forKey: .leagueKey)
        self.leagueName = try container.decode(String.self, forKey: .leagueName)
//        self.countryKey  = try container.decodeIfPresent(Int.self, forKey: .countryKey)
        self.leagueLogo = try container.decodeIfPresent(String.self, forKey: .leagueLogo)
    }
}
