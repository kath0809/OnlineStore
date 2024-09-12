//
//  SearchResultsSubCategoryCell.swift
//  OnlineStore
//
//  Created by Karima Thingvold on 11/09/2024.
//

import SwiftUI

struct SearchResultsSubCategoryCell: View {
     
    var subcategory: String
    
    var body: some View {
        Text(subcategory)
            .padding()
            .background(.gray)
    }
}
