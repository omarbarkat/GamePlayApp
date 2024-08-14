//
//  BGConstans.swift
//  GamePlay
//
//  Created by eng.omar on 13/08/2024.
//

import Foundation

struct BGConstants {
    
    
    // MARK: - Network response status
    
    static var success:Int {return 1}
    static var added:Int {return 202}
    static var failed:Int {return 0}
    static var created:Int {return 201}
    static var unprocessableEntity : Int {return 401}
    static var notActive : Int {return 405}
    static var unauthenticated : Int {return 403}
    static var notAcceptable : Int {return 422}
    static var notFound : Int {return 404}
    static var userType : Int {return 1}
        
    // MARK: - APIs Constants
    static var baseURL:String {return "https://apiv2.allsportsapi.com/"}
    static var foodball: String {return "\(baseURL)football/" }
    static var basketball: String {return "\(baseURL)basketball/" }
    static var cricket: String {return "\(baseURL)cricket/" }
    static var tennis: String {return "\(baseURL)tennis/" }
}
