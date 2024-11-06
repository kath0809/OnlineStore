//
//  Supplier.swift
//  OnlineStore
//
//  Created by Karima Thingvold on 05/11/2024.
//

import Foundation
import SwiftData

@Model
class Supplier : Decodable {
    var id: Int
    var name: String
    var country: String
    var contactInfo: String
    // skrives egentlig contact_info i db, så må mape med codingkeys.
    
    
    private var flagCode: String? {
        switch country {
        case "Sweden":
            return "SE"
        case "Denmark":
            return "DK"
        case "Germany":
            return "BE"
        default:
            return nil
        }
    }
    
    var flagURL: URL? {
        if let flagCode {
            return URL(string: "https://flagsapi.com/\(flagCode)/flat/64.png")!
        }
        return nil
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.country = try container.decode(String.self, forKey: .country)
        self.contactInfo = try container.decode(String.self, forKey: .contactInfo)
        
    }
    
    enum Keys: String, CodingKey {
        case id
        case name
        case country
        case contactInfo = "contact_info"
    }
}
