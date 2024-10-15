    //
    //  BasketView.swift
    //  OnlineStore
    //
    //  Created by Karima Thingvold on 24/09/2024.
    //

import SwiftUI
import SwiftData

struct CartView: View {
    
    @State private var animationPosistion = CGPoint.init(x: 200, y: 200)
    
        // Spørring til databasen, samme som -> Select * from Products
        // Kan sortere på hva som helst
    @Query(sort: \Product.name) var products:
    [Product]
    
    var body: some View {
        
        if products.isEmpty {
            emptyState
        } else {
            productList
        }
    }
    
        // Kan evt også ha vært ett eget view. Men da må den også få referanse på state til produktene. Det slipper man ved og ha den her.
    var productList: some View {
        List {
            ForEach(products) { product in
                HStack {
                    Text(product.name)
                    Stepper("Legg til/fjern produkt",
                            onIncrement: {
                        
                    }, onDecrement: {
                        
                    })
                }
            }
        }
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
}
