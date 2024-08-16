//
//  CricketModel.swift
//  GamePlay
//
//  Created by eng.omar on 16/08/2024.
//

import Foundation

struct CricketModel: Codable {
    let success: Int
    let result: [CricketResult]
}

struct CricketResult: Codable {
    let leagueKey: Int
    let leagueName, leagueYear: String
    var countryKey: String?


    enum CodingKeys: String, CodingKey {
        case leagueKey = "league_key"
        case leagueName = "league_name"
        case leagueYear = "league_year"
        case countryKey = "country_key"

    }
}
