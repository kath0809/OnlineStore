//
//  SearchView.swift
//  OnlineStore
//
//  Created by Karima Thingvold on 06/09/2024.
//

import SwiftUI

struct SearchView: View {
    
    @State var textfieldText: String = ""
    
    var body: some View {
        
        VStack {
            
            search
            Divider()
           
            menu
            
            productList
            
            Spacer()
        }
    }
    
    var search: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .padding(8)
            TextField(text: $textfieldText) {
                Label("Søk", systemImage: "magnifyingglass")
            }
        }
    }
    
    var menu: some View {
        HStack {
            Button(action: {
                print("trykka dame")
            }, label: {
                Text("Dame")
            })
        }
    }
    
    var productList: some View {
        List {
            Label("Nordisk stil", systemImage: "heart")
            Label("Nyheter", systemImage: "star")
            Label("Klær", systemImage: "figure.mixed.cardio")
        }
    }
}

#Preview {
    SearchView()
}
