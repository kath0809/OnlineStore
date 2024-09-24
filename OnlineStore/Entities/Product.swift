//
//  Product.swift
//  OnlineStore
//
//  Created by Karima Thingvold on 24/09/2024.
//

import Foundation

struct Product: Hashable, Codable, Identifiable {
    // let picture: Url / Asset
    let id: Int
    let brand: String
    let name: String
    let price: Int
    let fastDelivery: Bool

    static let mock = Product(id: 0, brand: "Brand", name: "Name", price: 20, fastDelivery: false)
}


struct SearchResponse: Decodable {
    let results: [Product]
}
