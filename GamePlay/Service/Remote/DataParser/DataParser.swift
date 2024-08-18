//
//  DataParser.swift
//  GamePlay
//
//  Created by eng.omar on 13/08/2024.
//

import Foundation

    
    
    class Decoderr {
        func decode<T: Decodable>(data: Data) throws -> T {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        }
    }

