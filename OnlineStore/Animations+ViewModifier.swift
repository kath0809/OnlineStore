//
//  Animations+ViewModifier.swift
//  OnlineStore
//
//  Created by Karima Thingvold on 08/10/2024.
//

import SwiftUI


struct PulsingEffect: ViewModifier {
    
    @State private var isPulsing = false
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                isPulsing = true
            }
            .scaleEffect(isPulsing ? 1.2 : 0.6)
            .animation(Animation .easeInOut(duration: 1)
                .repeatForever(autoreverses: true)
                       , value: isPulsing)
    }
}


extension View {
    func pulseEffect() -> some View {
        modifier(PulsingEffect())
    }
}


struct RotationEffect: ViewModifier {
    
    @State private var isRotating = false
    
    func body(content: Content) -> some View {
        content
        
            .onAppear {
                isRotating = true
            }
            .rotationEffect(isRotating ? .degrees(0) : .degrees(360))
        
            .animation(Animation .linear(duration: 1)
                .repeatForever(autoreverses: false)
                       , value: isRotating)
    }
}

extension View {
    func rotationEffect() -> some View {
        modifier(RotationEffect())
    }
}
