//
//  HomeViewModel.swift
//  GamePlay
//
//  Created by eng.omar on 13/08/2024.
//

import Foundation

class HomeViewModel {
    var homeModel: [HomeModel] = []
    func getHomeData() -> [HomeModel] {
        homeModel = [
            HomeModel(image: "football", title: "Football"),
            HomeModel(image: "basketball2", title: "Basketball"),
            HomeModel(image: "cricket", title: "Cricket"),
            HomeModel(image: "tennis", title: "Tennis")

        ]
        return homeModel
    }
}
