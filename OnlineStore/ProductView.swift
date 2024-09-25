    //
    //  ProductView.swift
    //  OnlineStore
    //
    //  Created by Karima Thingvold on 24/09/2024.
    //

import SwiftUI

struct MyProduct: Decodable, Identifiable, Hashable {
    
    var id: Self { self }
    
    let name: String
    let price: Float
    
}


struct ProductView: View {
    
    @State var selectedClothingType: ClothingType
    @State var products: [MyProduct] = []
    @State var selectedProduct: MyProduct?
    
    @State var isShowingError: Bool = false
    
    init(selectedClothingType: ClothingType) {
        self.selectedClothingType = selectedClothingType
        
    }
    
    var body: some View {
        VStack {
            Group {
                if let selectedProduct {
                    Text(selectedProduct.name)
                    
                    Text(selectedProduct.price.description)
                        .font(.subheadline)
                        .fontWeight(.bold)
                } else {
                    Text("Ikke valgt...")
                }
            }
            .padding(.vertical)
            .font(.title2)
            
            Text(" \(selectedClothingType.rawValue)")
            ScrollView {
                HStack {
                    ForEach(products) { product in
                        Button {
                            self.selectedProduct = product
                        } label: {
                            ZStack {
                                Color.yellow
                                VStack {
                                    Spacer()
                                    Text(product.name)
                                        .padding(.bottom)
                                        .font(.title3)
                                }
                            }
                            //.frame(height: 400)
                            .frame(height: UIScreen.main.bounds.height * 0.4)
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                await getProducts()
            }
        }
        .sheet(isPresented: $isShowingError) {
            Text("Something went wrong")
            Text("Please try again")
                .onAppear() {
                    print("is showing error")
                }
        }
    }
    
    
    
    
    func getProducts() async {
        
            //let session = URLSession()
        
        do {
            
            let url = selectedClothingType.url
            
            let urlRequest = URLRequest.standard(url: url)
            
            let response = try await URLSession.shared.data(for: urlRequest)
            
            let data = response.0
            data.prettyPrint()
            
            let products = try JSONDecoder().decode([MyProduct].self, from: data)
            print(products)
            self.products = products
            
        } catch {
            isShowingError = true
            print(error)
        }
    }
}

#Preview {
    ProductView(selectedClothingType: .klær)
    // ProductView(selectedClothingType: .allCases.randomElement()!)
    // Lurt å bruke for å se alle elementene
}
