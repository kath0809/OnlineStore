//
//  SettingsPerferedClothingCategoryCell.swift
//  OnlineStore
//
//  Created by Karima Thingvold on 24/09/2024.
//

import SwiftUI

struct SettingsPreferedClothingCategoryCell: View {

    @Binding var selectedClothingCategory: ClothingCategory
    var onButtonAction: (ClothingCategory) -> Void

    var body: some View {
        Button("Dame") {
            onButtonAction(.woman)
        }.background(selectedClothingCategory == .woman ? Color.gray : Color.clear)

        Button("Herre") {
            onButtonAction(.male)
        }.background(selectedClothingCategory == .male ? Color.gray : Color.clear)

        Button("Barn") {
            onButtonAction(.child)
        }.background(selectedClothingCategory == .child ? Color.gray : Color.clear)
        
        Button("Baby") {
            onButtonAction(.baby)
        }.background(selectedClothingCategory == .baby ? Color.gray : Color.clear)
    }
}
