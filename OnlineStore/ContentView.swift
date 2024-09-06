//
//  ContentView.swift
//  OnlineStore
//
//  Created by Karima Thingvold on 06/09/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                HomeView()
                .tabItem {
                    Label("Shopping", systemImage: "heart.fill")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
