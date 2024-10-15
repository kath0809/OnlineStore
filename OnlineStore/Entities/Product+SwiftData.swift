//
//  Product+SwiftData.swift
//  OnlineStore
//
//  Created by Karima Thingvold on 15/10/2024.
//

import Foundation
import SwiftData


extension Product {
    
    static func allStoredProducts(withId id: Int? = nil, inContext context: ModelContext) -> [Product] {
        
        var fetchDescriptor = FetchDescriptor<Product>()
        // Hvis vi sender inn id, så filtrer ut alle produkter med den id'en, hvis ikke - returner alle produkter.
        if let id {
            fetchDescriptor.predicate = #Predicate { product in
                return product.id == id
            }
        }
        
        do {
            return try context.fetch(fetchDescriptor)
        } catch {
            print("Error in fetch \(fetchDescriptor)")
            fatalError("error in fetch \(fetchDescriptor)")
            return [Product]()
        }
    }
}
