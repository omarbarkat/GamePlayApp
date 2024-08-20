//
//  LeaguesDetailsViewModelPorotocol.swift
//  GamePlay
//
//  Created by eng.omar on 20/08/2024.
//

import Foundation
protocol LeaguesDetailsViewModelPorotocol {
    func getData(apiParameter: APIParameters, isComingEvent: Bool, completionHandler: @escaping (ComingEventsModel) -> Void)
}
