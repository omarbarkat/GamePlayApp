//
//  DateManger.swift
//  GamePlay
//
//  Created by eng.omar on 18/08/2024.
//

import Foundation

class DateOptimizer{
    static var currentDate:String{
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatter.string(from: currentDate)
        return formattedDate
    }
    static var oneYearAfter:String{
        let currentDate = Date()
        let oneYearAfter = Calendar.current.date(byAdding: .month, value: 1, to: currentDate)!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatter.string(from: oneYearAfter)
        return formattedDate
    }
    static var oneYearBefore:String {
        let currentDate = Date()
        let oneYearBefore = Calendar.current.date(byAdding: .month, value: -1, to: currentDate)!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatter.string(from: oneYearBefore)
        return formattedDate
    }
}
