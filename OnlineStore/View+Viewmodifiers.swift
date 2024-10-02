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



struct WordArt3DModifier: ViewModifier {
    
    let baseColor: Color
    let shadowOffset: CGFloat
    
    func body(content: Content) -> some View {
        
        ZStack {
            content
                .offset(x: shadowOffset * 2, y: shadowOffset * 2)
                .foregroundStyle(baseColor)
            
            content
                .offset(x: shadowOffset, y: shadowOffset)
                .foregroundStyle(baseColor)
            
            content
                .foregroundStyle(.white)
            
            
        }
    }
}

// Kan legge det inn i den andre extension.
extension View {
    
    func wordArt3D(baseColor: Color = .green,
                   shadowOffset: CGFloat = 1.5)
    -> some View {
        return self.modifier(WordArt3DModifier(baseColor: baseColor, shadowOffset: shadowOffset))
    }
}

extension View {
    
    func measure() -> some View {
        overlay {
            GeometryReader { geometry in
                
                
                Rectangle()
                    .stroke(.pink, style:
                                StrokeStyle(lineWidth: 2))
                    . overlay {
                        Text(
                    """
                    \(Double(geometry.size.width).formatted(.number.precision(
                        .fractionLength(2))))
                ,
                    \(Double(geometry.size.height)
                        .formatted(.number
                        .precision(
                        .fractionLength(2))))
)
""")
                        
                        .font(.headline)
                        .kerning(-0.5)
                        .padding(.vertical, 1)
                        .padding(.horizontal, 2)
                        .foregroundStyle(.white)
                    }
            }
        }
    }
}



#Preview {
    ZStack {
        Color.black
            .opacity(0.9)
            .ignoresSafeArea()
        VStack {
            
            Text("Word art 3D!")
                //.font(.largeTitle)
                .font(.system(size: 60))
                .wordArt3D()
                //.wordArt3D(shadowOffset: 2)
                .measure()
            
            Divider()
            
                // Bruker ikke fargene som er satt default, men sender inn egne.
            Text("Hello, Custom!")
                .rainbowStyle(colors:[.blue, .black, .yellow, .red])
            
                // Bruker den standarden satt i rainbowStyle
            Text("Hello, Worl")
                .rainbowStyle()
                
        }
    }
}
