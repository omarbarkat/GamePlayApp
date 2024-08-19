//
//  Converter.swift
//  InstaSport
//
//  Created by zyad Baset on 19/08/2024.
//

import Foundation
import UIKit
class Converter{
    static func convertingImgToStr(img:String)->String{
        var str=""
        do{
            DispatchQueue.global().async {
                let imgData = try! Data(contentsOf: URL(string: img)!)
               let str = imgData.base64EncodedString(options: .lineLength64Characters)
            }
            
            
        }catch{
            
        }
        
        return str
    }
    
        static func convertingStrToImg(str: String) -> UIImage? {
            
            if let imgStr = Data(base64Encoded: str, options: .ignoreUnknownCharacters) {
                let image = UIImage(data: imgStr)
                return image
            }
            return nil
        }
    
}