    //
    //  SubcategoriesView.swift
    //  OnlineStore
    //
    //  Created by Karima Thingvold on 12/09/2024.
    //

    // SubcategoriesView.swift
import SwiftUI

struct SubcategoriesView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                SearchResultsSubCategoryCell(subcategory: "Polo")
                SearchResultsSubCategoryCell(subcategory: "Skjorter")
                SearchResultsSubCategoryCell(subcategory: "Bukser")
            }
        }
        .padding(.bottom)
    }
}


#Preview {
    SubcategoriesView()
}
