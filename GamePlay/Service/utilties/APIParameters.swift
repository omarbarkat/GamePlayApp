//
//  APIParameters.swift
//  GamePlay
//
//  Created by eng.omar on 18/08/2024.
//

import Foundation

enum APIParameters {
    case normal
    case comingEvent(leagueID: String)
    case latestEvent(leagueID: String)
    
    var paramters: [String: Any] {
        switch self {
        case .normal:
            return [
                         "met": "Leagues",
                         "APIkey": "781caa8a35913d04b7a8f150114a3dddba894c05c380891b3a55100c60d9afe5"
                     ]
        case .comingEvent(let leagueID):
            return [
                         "met": "Fixtures",
                         "leagueId": leagueID,
                         "from":   DateOptimizer.currentDate,
                         "to":  DateOptimizer.oneYearAfter ,
                         "APIkey": "2c28d4947373c9aad33c4b48c0f99c79ce4469f4c59f207b0ee9d8f73d2ae9e2"
                     ]
        case .latestEvent(let leagueID):
            return [
                         "met": "Fixtures",
                         "leagueId": leagueID,
                         "from":   DateOptimizer.oneYearBefore,
                         "to":  DateOptimizer.currentDate ,
                         "APIkey": "2c28d4947373c9aad33c4b48c0f99c79ce4469f4c59f207b0ee9d8f73d2ae9e2"
                     ]
        }
    }
}
