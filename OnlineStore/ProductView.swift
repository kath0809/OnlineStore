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
    
    func didTap(product: Product) {
        
        self.selectedProduct = product
        
        amountInCart = Product.allStoredProducts(withId: product.id, inContext: modelContext).count
    }
    
    func suppliersView(product: Product) -> some View {
        VStack(alignment: .leading) {
            Text("Leverandør:")
                .padding(.bottom)
                .font(.subheadline)
    
            
            ForEach(product.suppliers) { supplier in
                HStack {
                    Text(supplier.name)
                    Spacer()
                    Text(supplier.country)
                    AsyncImage(url: supplier.flagURL)
                    Spacer()
                    Text(supplier.contactInfo)
                    
                }
                .font(.footnote)
                
            }
        }
        .padding()
        .background{
            Color.gray
                .opacity(0.3)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
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
                        
                        selectedProduct.storedInDatabase(context: modelContext)
                        
                        amountInCart = Product.allStoredProducts(withId: selectedProduct.id, inContext: modelContext).count
                        
                        print("Trykket legg til produkt")
                        
                    } onDecrement: {
                        
                        selectedProduct.deleteFromDatabase(context: modelContext)
                            // Select * From Products where id == selectedProduct.is
                        let result = Product.allStoredProducts(withId: selectedProduct.id, inContext: modelContext)
                        amountInCart = result.count
                        print("Trykket fjern produkt")
                    }
                    suppliersView(product: selectedProduct)
                }
            }
        }
        .padding()
        .font(.title2)
        
        Text(" \(selectedClothingType.rawValue)")
        ScrollView(.horizontal) {
            HStack {
                ForEach(products) { product in
                    Button {
                        didTap(product: product)
                    } label: {
                        ZStack {
                            AsyncImage(url: product.imageURL) { image in
                                image.resizable()
                                    .frame(width: 200, height: 200)
                                    .clipShape(.rect(cornerRadius: 20))
                                    .overlay {
                                    if selectedProduct?.id == product.id {
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.green, lineWidth: 5)
                                    }
                                }
                                
                            } placeholder: {
                                
                                Color.blue
                                    .frame(width: 200, height: 200)
                                    .clipShape(.rect(cornerRadius: 20))
                                
                                ProgressView()
                            }
                            
                            
                            
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
            
                // Oppdater handlekurven med riktig antall produkter.
            amountInCart = Product.allStoredProducts(withId: selectedProduct?.id, inContext: modelContext).count
            
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
    
        // Spesifier hvilken database preview skal bruke for at ting som har med databsen skal fungere i preview og ikke bare i simulator.
        .modelContainer(sharedModelContainer)
}
