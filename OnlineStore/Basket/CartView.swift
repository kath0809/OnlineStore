    //
    //  BasketView.swift
    //  OnlineStore
    //
    //  Created by Karima Thingvold on 24/09/2024.
    //

import SwiftUI

struct CartView: View {
    
    @State private var animationPosistion = CGPoint.init(x: 200, y: 200)
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image(systemName: "cart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .pulseEffect()
                    .rotationEffect()
                
                    .position(animationPosistion)
                
                Text("Hello!")
                    .font(.largeTitle)
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
