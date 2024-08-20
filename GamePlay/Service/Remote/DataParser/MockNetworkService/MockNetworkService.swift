//
//  MockNetworkService.swift
//  GamePlay
//
//  Created by eng.omar on 20/08/2024.
//

import Foundation

protocol MockNetworkServiceProtocol {
    func request<T: Decodable>(_ endpoint: String, parameters: [String: Any]?, completion: @escaping (Result<T, Error>) -> Void)
}

class MockNetworkService: MockNetworkServiceProtocol {
    var mockData: Data?
    var mockError: Error?
    
    func request<T: Decodable>(_ endpoint: String, parameters: [String: Any]?, completion: @escaping (Result<T, Error>) -> Void) {
        if let error = mockError {
            completion(.failure(error))
        } else if let data = mockData {
            do {
                let decodedObject: T = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedObject))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
