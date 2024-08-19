//
//  Model.swift
//  GamePlay
//
//  Created by eng.omar on 18/08/2024.
//
import Foundation
struct Coach: Codable {
    let coachName: String

    enum CodingKeys: String, CodingKey {
        case coachName = "coach_name"
    }
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.coachName = try container.decode(String.self, forKey: .coachName)
    }
}
