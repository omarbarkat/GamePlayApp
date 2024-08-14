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
//    var parser: DataParser?
    static let baseURL = "https://apiv2.allsportsapi.com/football/"
    
    
    func request<T: Decodable>(_ endpoint: String, completion: @escaping (Resultt<T, Error>) -> Void) {
          AF.request(endpoint).responseData { response in
              switch response.result {
              case .success(let data):
                  do {
                      // استخدام الـ decoder الموجود في ال Decoder class
                      let decodedObject: T = try Decoder().decode(data: data)
                      completion(.success(decodedObject))
                  } catch {
                      completion(.failure(error))
                  }
              case .failure(let error):
                  completion(.failure(error))
              }
          }
      }
}


//func getData() {
//      let url = "https://apiv2.allsportsapi.com/football/"
//     
//      let param =
//      [
//          "met" : "Leagues",
//          "APIkey": "2c28d4947373c9aad33c4b48c0f99c79ce4469f4c59f207b0ee9d8f73d2ae9e2"
//      ]
//      AF.request(url, method: .get ,parameters: param).responseJSON { response in
//          print(response)
////            let json = try! JSONSerialization.jsonObject(with: response.result, options: [])
//      }
//  }
