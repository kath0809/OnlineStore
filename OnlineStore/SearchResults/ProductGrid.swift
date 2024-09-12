    //
    //  ProductGrid.swift
    //  OnlineStore
    //
    //  Created by Karima Thingvold on 12/09/2024.
    //


import SwiftUI

struct ProductsGridView: View {
    var product: Product
    
    var body: some View {
/// Bruker LazyVGrid for å lage et rutenett med 2 kolonner og avstand mellom elementene.
        LazyVGrid(columns: [
            GridItem(.flexible(), spacing: 20), ///Første kolonne med fleksibel bredde og 20 avstand.
            GridItem(.flexible()) /// Andre kolonne

            
        ], spacing: 20) { // Avstand mellom radene
            // Produktene som vises i rutenettet
            SearchResultsProductCell(product: product)
            SearchResultsProductCell(product: product)
            SearchResultsProductCell(product: product)
            SearchResultsProductCell(product: product)
            
            // // En seksjon med en overskrift og flere produkter under.
            Section {
                SearchResultsProductCell(product: product)
                SearchResultsProductCell(product: product)
                SearchResultsProductCell(product: product)
                SearchResultsProductCell(product: product)
            } header: {
                Text("Header goes here")
                    .frame(maxWidth: .infinity)
                    .background(.red)
            }
        }
    }
}

