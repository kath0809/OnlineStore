    //
    //  FiltersView.swift
    //  OnlineStore
    //
    //  Created by Karima Thingvold on 12/09/2024.
    //

    // FiltersView.swift
import SwiftUI

struct FiltersView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Filter....")
                .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView(.horizontal) {
                LazyHStack {
                    Text("New")
                    Text("Brand")
                    Text("Price")
                    Text("Color")
                }
            }
        }
    }
}

