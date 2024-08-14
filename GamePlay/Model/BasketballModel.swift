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

struct BasketballResult: Codable {
    let countryKey: Int
    let countryName: String

    enum CodingKeys: String, CodingKey {
        case countryKey = "country_key"
        case countryName = "country_name"
    }
}
