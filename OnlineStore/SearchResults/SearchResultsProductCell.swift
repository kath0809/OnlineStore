    //
    //  SearchResultsProductCell.swift
    //  OnlineStore
    //
    //  Created by Karima Thingvold on 12/09/2024.
    //

import SwiftUI

struct Product {
        // let picture: Url / Asset
    let brand: String
    let name: String
    let price: Int
    let delivery: String
}

struct SearchResultsProductCell: View {
    
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            imageHeader
            Text(product.brand)
                .font(.body)
            Text(product.name)
            
                // NumberFormatter() + NSNumberFormatterCurrencyStyle
            
            Text("\(product.price)")
            Text(product.delivery)
                .font(.footnote)
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

    //#Preview {
    //    SearchResultsProductCell()
    //}
