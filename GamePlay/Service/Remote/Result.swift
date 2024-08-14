//
//  Result.swift
//  GamePlay
//
//  Created by eng.omar on 13/08/2024.
//

import Foundation

enum Resultt<Success, Failure: Error> {
    case success(Success)
    case failure(Failure)
}
