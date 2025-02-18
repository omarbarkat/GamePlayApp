//
//  TeamsModel.swift
//  GamePlay
//
//  Created by eng.omar on 18/08/2024.
//

import Foundation

struct TeamsModel:Hashable{
    let imgUrl:String
    let teamKey:String
    let teamName:String
    init(imgUrl: String, teamKey: String,teamName:String) {
        self.imgUrl = imgUrl
        self.teamKey = teamKey
        self.teamName = teamName
    }
    static func == (lhs: TeamsModel, rhs: TeamsModel) -> Bool {
            return lhs.teamKey == rhs.teamKey
        }
    func hash(into hasher: inout Hasher) {
            hasher.combine(teamKey)
            
        }
}
