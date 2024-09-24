//
//  FavoritesView.swift
//  OnlineStore
//
//  Created by Karima Thingvold on 24/09/2024.
//

import SwiftUI

struct FavoritesView: View {

    @State var products: [Product]

    var body: some View {
        LazyVStack {
            ForEach(products) { product in
                FavoritesCell(product: product)
            }
        }.onAppear {
            products = FavoriteProductsRepository().getProducts()
        }
    }
}

struct CurrencyMapper {

    func map(int: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "no")
        return formatter.string(from: NSNumber(value: int)) ?? "--"
    }

}
