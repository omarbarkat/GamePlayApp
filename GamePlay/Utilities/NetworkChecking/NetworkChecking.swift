//
//  NetworkChecking.swift
//  GamePlay
//
//  Created by eng.omar on 20/08/2024.
//

import Foundation
import Network

class Connectivity {
    static let shared = Connectivity()
    private init() {}
    
    func check(compilation: @escaping(Bool)->()) {
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            let status = path.status == .satisfied
            DispatchQueue.main.async {
                compilation(status)
            }
            monitor.cancel()
        }
        monitor.start(queue: .main)
    }
}

