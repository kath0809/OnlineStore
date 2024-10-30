//
//  APIService.swift
//  OnlineStore
//
//  Created by Karima Thingvold on 30/10/2024.
//

import Foundation
import SwiftUI

enum ClothingType: String, CaseIterable, Identifiable {
    
    public var id: String {
        return rawValue
    }
    
    case klær = "Klær"
    case sko = "Sko"
    case accessories = "Accessories"
    case streetwear = "Streetwear"
    
    
    var url: URL {
        switch self {
        case .klær:
            return URL.init(string: "https://raw.githubusercontent.com/BeiningBogen/PG5602/refs/heads/master/Nettbutikk/products.json")!
            
        case .sko:
            return URL.init(string: "https://raw.githubusercontent.com/BeiningBogen/PG5602/refs/heads/master/Nettbutikk/sko.json")!
            
                // Prøv å unngå der mulig.
        default:
            return URL.init(string: "https://raw.githubusercontent.com/BeiningBogen/")!
        }
    }
    
}
