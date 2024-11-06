//
//  Product.swift
//  OnlineStore
//
//  Created by Karima Thingvold on 24/09/2024.
//

import Foundation
import SwiftData

@Model
class Product: Hashable, Codable, Identifiable {
    
    /// Skriver til JSON:
    /// Lagrer til disk.
    func encode(to encoder: any Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(brand, forKey: .brand)
        try container.encode(name, forKey: .name)
        try container.encode(price, forKey: .price)
        try container.encode(fastDelivery, forKey: .fastDelivery)
        try container.encodeIfPresent(imageURL, forKey: .imageURL)
    }
    
    
    /// Les inn fra JSON:
    required init(from decoder: any Decoder) throws {
        // Sette alle attributter som ikke er optinal.
        
        // Sette opp hvilke nøkler som kan brukes til dette objektet(container)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        brand = try container.decode(String.self, forKey: .brand)
        name = try container.decode(String.self, forKey: .name)
        price = try container.decode(Int.self, forKey: .price)
        fastDelivery = try container.decode(Bool.self, forKey: .fastDelivery)
        imageURL = try container.decodeIfPresent(URL.self, forKey: .imageURL)
        suppliers = try container.decode([Supplier].self, forKey: .suppliers)
        
    }
    
    // Konstruktør
    init(id: Int, brand: String, name: String, price: Int, fastDelivery: Bool, imageURL: URL?, suppliers: [Supplier]) {
        self.id = id
        self.brand = brand
        self.name = name
        self.price = price
        self.fastDelivery = fastDelivery
        self.imageURL = imageURL
        self.suppliers = suppliers
    }
    
    
    var id: Int
    var brand: String
    var name: String
    var price: Int
    var fastDelivery: Bool
    var imageURL: URL?
    // var image: Image
    var suppliers: [Supplier] // 
    
    enum CodingKeys: String, CodingKey {
        case id
        case brand
        case name
        case price
        case fastDelivery = "fast_delivery" // Ikke bruk navngivingen som er i json formatet. Bruk Camelcase som er riktig for Swift.
        case imageURL = "image"
        case suppliers
    }
}


struct SearchResponse: Decodable {
    let results: [Product]
}
