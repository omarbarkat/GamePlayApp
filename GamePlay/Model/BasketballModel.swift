//
//  BasketballModel.swift
//  GamePlay
//
//  Created by eng.omar on 13/08/2024.
//

import Foundation

struct BasketballModel: Codable {
    let success: Int
    let result: [BasketballResult]
}

// MARK: - Result
struct BasketballResult: Codable {
    let leagueKey: Int
    let leagueName: String
    let countryKey: Int
    let countryName: String

    enum CodingKeys: String, CodingKey {
        case leagueKey = "league_key"
        case leagueName = "league_name"
        case countryKey = "country_key"
        case countryName = "country_name"
    }
}
