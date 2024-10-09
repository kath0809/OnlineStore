    //
    //  ProductView.swift
    //  OnlineStore
    //
    //  Created by Karima Thingvold on 24/09/2024.
    //

import SwiftUI
import SwiftData

struct ProductView: View {
    
    // Vi lager en lokal attributt fra en Enviroment variabel
    @Environment(\.modelContext) var modelContext
    
    @State var selectedClothingType: ClothingType
    @State var products: [Product] = []
    @State var selectedProduct: Product?
    
    @State var isShowingError: Bool = false
    
    @State var amountInCart = 0
    
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
                    
                    Text("I handlekurven: \(amountInCart)")
                    
                    Stepper("Legg til i handlekurv") {
                        modelContext.insert(selectedProduct)
                        //amountInCart += 1
                        do {
                            try modelContext.save()
                        } catch {
                            print("Error ved lagring: \(error.localizedDescription)")
                        }
                        
                        print("Trykket 'legg til'")
                        
                        var fetchDescriptor = FetchDescriptor<Product>()
                        fetchDescriptor.predicate = nil
                        
                        do {
                            let result = try modelContext.fetch(fetchDescriptor)
                            amountInCart = result.count
                        } catch {
                            print("Error ved fetching etter insert \(error.localizedDescription)")
                        }
                        
                    } onDecrement: {
                        modelContext.delete(selectedProduct)
                        
                        var fetchDescriptor = FetchDescriptor<Product>()
                        
                        do {
                            let result = try modelContext.fetch(fetchDescriptor)
                            amountInCart = result.count
                        } catch {
                            print("Error ved fetch etter delete! \(error.localizedDescription)")
                        }
                        
                        amountInCart -= 1
                        print("Trykket 'fjern produkt'")
                        
                    }

                } else {
                    Text("Ikke valgt...")
                }
            }
            .padding()
            .font(.title2)
            
            Text(" \(selectedClothingType.rawValue)")
            ScrollView(.horizontal) {
                HStack {
                    ForEach(products) { product in
                        Button {
                            self.selectedProduct = product
                            
                            var fetchDescriptor = FetchDescriptor<Product>()
                            
                            do {
                                let result = try modelContext.fetch(fetchDescriptor)
                                amountInCart = result.count
                            } catch {
                                print("Error ved fetch etter delete! \(error.localizedDescription)")
                            }
                            
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
            
            let products = try JSONDecoder().decode([Product].self, from: data)
            print(products)
            
            self.products = products
            selectedProduct = products.first
            
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
