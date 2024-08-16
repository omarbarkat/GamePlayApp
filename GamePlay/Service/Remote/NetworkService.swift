//
//  NetworkService.swift
//  GamePlay
//
//  Created by eng.omar on 13/08/2024.
//

import Foundation
import Alamofire


protocol NetworkServiceProtocol {
    func request<T: Decodable>(_ endpoint: String, completion: @escaping (Resultt<T, Error>) -> Void)


}

class NetworkService: NetworkServiceProtocol {
    func request<T: Decodable>(_ endpoint: String, completion: @escaping (Resultt<T, Error>) -> Void) {
          AF.request(endpoint).responseData { response in
              print(response.result)
              switch response.result {
              case .success(let data):
                  do {
                      let decodedObject: T = try Decoder().decode(data: data)
                      completion(.success(decodedObject))
                      print(decodedObject)
                  } catch {
                      completion(.failure(error))
                  }
              case .failure(let error):
                  completion(.failure(error))
              }
          }
      }
}


