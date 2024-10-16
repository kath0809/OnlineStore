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
                //return [Product]()
        }
    }
    
    func storedInDatabase(context: ModelContext) {
            /// Lag kopi av self (Produktet), og legg inn i DB
        context.insert(Product(id: self.id, brand: self.brand, name: self.name, price: self.price, fastDelivery: self.fastDelivery))
        
        do {
                /// Skriv endringer i modelcontext til disk
            try context.save()
        } catch {
            print("Could nor store product \(self), error: \(error)")
        }
    }
    
    /**
     Context: Hvilke DB skal vi slette fra
     */
    func deleteFromDatabase(context: ModelContext) {
        /// Hent ut produkt med samme id som self
        if let product = Product.allStoredProducts(withId: self.id, inContext: context).first {
            
            context.delete(product)
            
            do {
                try context.save()
            } catch {
                print("Could not delete product \(self), error: \(error)")
            }
        } else {
            print("Could not find product with id \(self) to delete")
        }
    }
}
