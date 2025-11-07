//
//  Horoscope.swift
//  Horoscopo-ios
//
//  Created by Mananas on 6/11/25.
//

import Foundation
import UIKit

struct Horoscope {
    let id: String
    let name: String
    let dates: String
 
    func getSignIcon() -> UIImage {
        return UIImage(named: "horoscope_icons/\(id)_icon")!
    }
    
    static let horoscopeList = [
        Horoscope(id: "aries", name: "Aries", dates: "March 21 to Abril 19")
    ]
    
    static func getAll() -> [Horoscope] {

        return horoscopeList
    }
    
    static func getById( id: String) -> Horoscope {
        return Horoscope.getAll().first(where: { $0.id == id})!
        
    }
    
}
