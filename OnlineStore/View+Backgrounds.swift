//
//  View+Backgrounds.swift
//  OnlineStore
//
//  Created by Karima Thingvold on 08/10/2024.
//

import SwiftUI

struct RainbowBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(gradient:
                Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            )
    }
}

extension View {
    func rainbowBackground() -> some View {
        self.modifier(RainbowBackground())
    }
}


#Preview {
    VStack {
        Text("Hello, World!")
    }
    .rainbowBackground()
}
