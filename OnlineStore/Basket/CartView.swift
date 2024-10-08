//
//  BasketView.swift
//  OnlineStore
//
//  Created by Karima Thingvold on 24/09/2024.
//

import SwiftUI

struct CartView: View {

    @State var isPulsing = false
    @State var isRotating = false



    var body: some View {
        VStack {
            Image(systemName: "cart")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
            
                .scaleEffect(isPulsing ? 1.2 : 1)
                .animation(Animation .easeInOut(duration: 1)
                    .repeatForever(autoreverses: true)
                           , value: isPulsing)
            
                .rotationEffect(isRotating ? .degrees(0) : .degrees(360))
            
                .animation(Animation .easeInOut(duration: 1)
                    .repeatForever(autoreverses: false)
                           , value: isRotating)
            
            Text("Hello!")
                .font(.largeTitle)
        }
        .rainbowBackground()
        .onAppear {
            isPulsing = true
            isRotating = true
        }
    }
}

#Preview {
    CartView()
}
