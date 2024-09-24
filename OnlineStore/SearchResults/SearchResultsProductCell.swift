    //
    //  SearchResultsProductCell.swift
    //  OnlineStore
    //
    //  Created by Karima Thingvold on 12/09/2024.
    //

import SwiftUI

struct SearchResultsProductCell: View {

    var product: Product
//    var isFavorite: Bool

    var body: some View {
        VStack(alignment: .leading) {
            imageHeader
            Text(product.brand)
                .font(.body)
            Text(product.name)
//            NumberFormatter() + NSNumberFormatterCurrencyStyle
            Text("\(product.price)")
//            Text(product.delivery)
//                .font(.footnote)
        }
        .background(.green)
    }

    // MARK: - Private

    private var imageHeader: some View {
        ZStack {
            Image(systemName: "star")
                .resizable()
                .aspectRatio(contentMode: .fill)
            VStack {
                Button("favorite") {
                    print("toggle favorite")
                    // Warning, this works because favorite repository uses shared space in UserDefaults
                    FavoriteProductsRepository().toggleFavorite(product)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                Spacer()
                Text("Nyhet")
                    .background(.red)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }

}

#Preview {
    SearchResultsProductCell(product: .mock)
}
