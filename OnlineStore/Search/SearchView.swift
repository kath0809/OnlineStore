    //
    //  SearchView.swift
    //  OnlineStore
    //
    //  Created by Karima Thingvold on 06/09/2024.
    //

import SwiftUI

enum ClothingCategory: String, CaseIterable, Identifiable {
    
    public var id: String { rawValue }
    
    case woman = "Dame"
    case male = "Herre"
    case child = "Barn"
    case baby = "Baby"
}

struct SearchView: View {
    
    @State var textfieldText: String = ""
    
    @State var searchCategories = SearchCategory.defaultCategories
    
    @State var selectedClothingCategory: ClothingCategory = .woman {
        didSet {
            print(selectedClothingCategory)
        }
    }
    
    
//    @State var listElement = [
//        SearchCategory(name: "Nordisk Stil", systemImageName: "heart"),
//        SearchCategory(name: "Nyheter", systemImageName: "star"),
//        SearchCategory(name: "Klær", systemImageName: "figure.mixed.cardio")
//    ]
    
    @State var searchSuggestions = [String]()
    @State var isLoading = false
    
    
    func didTap(clothingCategory: ClothingCategory) {
        selectedClothingCategory = clothingCategory
        switch selectedClothingCategory {
        case .woman:
            searchCategories = SearchCategory.defaultCategories
        case .male:
            searchCategories = SearchCategory.maleCategories
        case .child:
            searchCategories = SearchCategory.childrenCategories
        case .baby:
            searchCategories = SearchCategory.babyCategories
        }
    }
    
    var body: some View {
        
        VStack {
            
            search
            Divider()
            
            menu
            Divider()
            
            if isLoading {
                ProgressView()
            } else if searchSuggestions.isEmpty {
                catergoriesList
            } else {
                searchSuggestionList
            }
            
            Spacer()
        }
    }
    
    var search: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField(text: $textfieldText) {
                Text("Søk") // placeholder
            }
            .onSubmit {
                print("The search text \(textfieldText)")
                isLoading = true
                
                Task {
                    searchSuggestions = await fetchSuggestions(for: textfieldText)
                    isLoading = false
                        // Do some "Api call" to get the actual suggestion list
                        //searchSuggestions = [textfieldText, textfieldText + "_suffix"]
                }
            }
        }
        .padding(.leading)
        .padding(.bottom)
    }
    
    
    func fetchSuggestions(for searchText: String) async -> [String] {
        try? await Task.sleep(for: .seconds(3))
        return [textfieldText, textfieldText + "_suffix"]
    }
    
    var menu: some View {
        HStack {
            Spacer()
            
            ForEach(ClothingCategory.allCases) { clothingCategory in
                
                Button(action: {
                    didTap(clothingCategory: clothingCategory)
                        //print("Tapped \(clothingCategory)")
                    
                }, label: {
                    
                    Text("\(clothingCategory.rawValue)")
                        .fontWeight(
                            selectedClothingCategory == clothingCategory ? .bold : .regular
                        )
                })
            }
            Spacer()
        }
    }
    
    
    
    var catergoriesList: some View {
        List {
            ForEach(searchCategories) { searcCategory in
                Label(searcCategory.name, systemImage: searcCategory.systemImageName)
            }
        }
        .listStyle(.plain)
    }
    
    var searchSuggestionList: some View {
        List {
            ForEach(searchSuggestions, id: \.self) { searchSuggestion in
                Text(searchSuggestion)
            }
        }
        .listStyle(.plain)
    }
}



#Preview {
    SearchView()
}
