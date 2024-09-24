    //
    //  ProductView.swift
    //  OnlineStore
    //
    //  Created by Karima Thingvold on 24/09/2024.
    //

import SwiftUI

struct ProductView: View {
    
    @State var selectedClothingType: ClothingType
    
    init(selectedClothingType: ClothingType) {
        self.selectedClothingType = selectedClothingType
        
    }
    
    var body: some View {
        Text("Hello, World! \(selectedClothingType.rawValue)")
            .onAppear {
                Task {
                    await getProducts()
                }
            }
    }
    
    func getProducts() async {
        //let session = URLSession()
        do {
            
            let response = try await URLSession.shared.data(from:URL(string: "https://vg.no/")!)
            
            let data = response.0

            print(String.init(data: data, encoding: .utf8))
            
            let products = try JSONDecoder().decode([Product].self, from: data)
            
        } catch {
            print(error)
        }
    }
}


#Preview {
    ProductView(selectedClothingType: .allCases.randomElement()!)
}
