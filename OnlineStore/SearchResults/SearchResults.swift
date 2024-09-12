    //
    //  SearchResults.swift
    //  OnlineStore
    //
    //  Created by Karima Thingvold on 11/09/2024.
    //

import SwiftUI

struct SearchResults: View {
    var body: some View {
        
            // Bruker en ScrollView for å gjøre det mulig å rulle gjennom innholdet.
        ScrollView {
                // Viser subkategorier, filtre, og produkter i en rullbar liste.
            SubcategoriesView()
            FiltersView()
            ProductsGridView(product: product)
        }
        .padding() // Legger til litt avstand rundt hele innholdet.
    }
    
        // Oppretter en eksempelprodukt for å vise produktene i rutenettet.
    private var product = Product(brand: "Brand", name: "Name", price: 200, delivery: "Delivery")
}

#Preview {
    SearchResults()
}
