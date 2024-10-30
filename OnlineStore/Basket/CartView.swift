    //
    //  BasketView.swift
    //  OnlineStore
    //
    //  Created by Karima Thingvold on 24/09/2024.
    //

import SwiftUI
import SwiftData

struct CartView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @State private var animationPosistion = CGPoint.init(x: 200, y: 200)
    
        // Spørring til databasen, samme som -> Select * from Products
        // Kan sortere på hva som helst
    @Query(sort: \Product.name) var products: [Product]
    var uniqueProducts: [Product] {
        
            /// Lag ett Set med alle produkte IDer
        var identifiedIds: Set<Int> = []
            /// FIltrer alle produkter basert på logikken i closuren:
        return products.filter { product in
                /// Hvis de sette idene inneholder produktet vi er på nå:
            if identifiedIds.contains(product.id) {
                    /// fjern produktet fra arrayet
                return false
            } else {
                    /// Legg til i Set over "identifiserte id´er"
                identifiedIds.insert(product.id)
                    /// Legg til i Arrayet vi returnerer fra funksjonen (filter)
                return true
            }
        }
    }
    
    var totalPrice: Double {
         uniqueProducts.reduce(0) { result, product in
             let quantity = Product.allStoredProducts(withId: product.id, inContext: modelContext).count
             return result + (Double(quantity) * Double(product.price))
         }
     }
    
    var body: some View {
        
        if products.isEmpty {
            emptyState
        } else {
            productList
            totalFooter
        }
    }
    
    var productList: some View {
        List {
            ForEach(uniqueProducts) { product in
                ProductRow(product: product)
            }
        }
    }
    
    var totalFooter: some View {
          HStack {
              Spacer()
              Text("Total Price: \(totalPrice, specifier: "%.2f") kr")
                  .font(.title3)
                  .fontWeight(.semibold)
                  .padding()
          }
          .background(Color(.systemGray6))
      }
    
    var emptyState: some View {
        GeometryReader { geometry in
            VStack {
                Image(systemName: "cart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .pulseEffect()
                    .rotationEffect()
                
                    .position(animationPosistion)
                
                Text("No items in cart!")
                    .font(.body)
            }
            .rainbowBackground()
        }
        
        .onTapGesture { location in
            print(location)
            withAnimation(.spring) {
                animationPosistion = location
            }
        }
    }
}

#Preview {
    CartView()
        .modelContainer(sharedModelContainer)
}
