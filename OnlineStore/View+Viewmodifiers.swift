//
//  View+Viewmodifiers.swift
//  OnlineStore
//
//  Created by Karima Thingvold on 02/10/2024.
//

import SwiftUI

struct RainbowModifier: ViewModifier {
    
    private let colors: [Color]
    
    init(colors:[Color]) {
        self.colors = colors
    }
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundStyle(LinearGradient(colors: colors, startPoint: .leading, endPoint: .trailing))
    }
}

// some view = skal returnere ett view
// return self , self = view forid vi lager ett view.

extension View {
    func rainbowStyle(colors: [Color] = [.red, .orange, .yellow, .green, .blue, .indigo, .purple]) -> some View {
        return self.modifier(RainbowModifier(colors: colors))
    }
}

#Preview {
    
    // Bruker ikke fargene som er satt default, men sender inn egne.
    Text("Hello, World!")
        .rainbowStyle(colors:[.blue, .black, .yellow, .red])
    
    // Bruker den standarden satt i rainbowStyle
    Text("Hello, World!")
        .rainbowStyle()
}
