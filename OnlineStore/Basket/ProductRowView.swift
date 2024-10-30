    //
    //  ProductRowView.swift
    //  OnlineStore
    //
    //  Created by Karima Thingvold on 30/10/2024.
    //

import SwiftUI
import SwiftData

struct ProductRow: View {
    
    @Environment(\.modelContext) var modelContext
    @State private var productAmount = 0
    
    var product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var body: some View {
        HStack {
            VStack {
            Text(product.name.split(separator: "-").first ?? "")
                .font(.body)
                .foregroundColor(.primary)
                //.lineLimit(2)
                //.truncationMode(.tail)
            
                Text("\(product.price)")
                    .font(.footnote)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            Text("\(productAmount)")
                .font(.headline)
                .fontWeight(.bold)
                .frame(width: 50)
                .multilineTextAlignment(.center)
            
            Stepper("", onIncrement: {
                product.storedInDatabase(context: modelContext)
                productAmount = Product.allStoredProducts(withId: product.id, inContext: modelContext).count
            }, onDecrement: {
                product.deleteFromDatabase(context: modelContext)
                productAmount = Product.allStoredProducts(withId: product.id, inContext: modelContext).count
            })
        }
        .onAppear {
            productAmount = Product.allStoredProducts(withId: product.id, inContext: modelContext).count
        }
    }
}
