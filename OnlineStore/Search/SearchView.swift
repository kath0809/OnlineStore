    //
    //  SearchView.swift
    //  OnlineStore
    //
    //  Created by Karima Thingvold on 06/09/2024.
    //

import SwiftUI

enum ClothingCategory: String, CaseIterable, Identifiable, Codable {
    
    public var id: String { rawValue }
    
    case woman = "Dame"
    case male = "Herre"
    case child = "Barn"
    case baby = "Baby"
}

struct OnlineError: Error, LocalizedError {
    var errorDescription: String? {
        return "Something went wrong"
    }
}

struct SearchView: View {
    
    //@State var error: LocalizedError?
    @State var isShowingError = false
    
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
    
    private let userSettingsRepository = UserSettingsRepository()
    
    
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
        .onAppear {
            selectedClothingCategory = userSettingsRepository.get().preferedClothingCategory
        }
        .alert(isPresented: $isShowingError, error: error) {
            Button("OK") {
                //
            }
        }
//        .alert("Noe gikk galt", isPresented: $isShowingError) {
//            Button("OK") {
//                isShowingError = false
//            }
//        }
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
                    do {
                        searchSuggestions = try await fetchSuggestions(for: textfieldText)
                        isLoading = false
                    } catch {
                        self.error = error as? LocalizedError
                        isShowingError = true
                        isLoading = false
                    }
                }
            }
        }
        .padding(.leading)
        .padding(.bottom)
    }
    
    
    func fetchSuggestions(for searchText: String) async throws -> [String] {
        let request = URLRequest.standard(url: URL(string: "https://github.com/BeiningBogen/PG5602/blob/master/Nettbutikk/searchresults.json")!)
        
            let( data, response ) = try await URLSession.shared.data(for: request)
            let searchResults = try JSONDecoder().decode([String].self, from: data)
            print(searchResults)
            return searchResults
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
