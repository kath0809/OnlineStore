    //
    //  HomeView.swift
    //  OnlineStore
    //
    //  Created by Karima Thingvold on 06/09/2024.
    //

import SwiftUI


enum ClothingType:  String, CaseIterable, Identifiable {
    
    public var id: String { rawValue }
    // id er attributt, liten forbokstav
    
    case clothes = "Klær"
    case shoes = "Sko"
    case accessories = "Accessories"
    case streetwear = "Streetwear"
    
}

struct HomeView: View {
    
//    @State var isShowingSheet: Bool = false
    @State var isShowingSheet = false
    
    @State var selectedClothingType: ClothingType = .clothes
    
    func didTap(clothingType: ClothingType) {
        print("Tapped \(clothingType)")
        
        selectedClothingType = clothingType
        isShowingSheet = true
        
    }
    
    var body: some View {
        VStack {
            
            ZStack {
                
                Color.orange
                HStack {
                    
                    VStack(alignment: .leading) {
                        
                        Text("Kickstart høsten")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("Spar opptil 50% på tusenvis av varer")
                            .font(.title)
                        
                    }
                    .padding(.leading)
                    Spacer()
                }
            }
            .frame(height: 150)
            .foregroundStyle(.white)
            
            
            
            
            ZStack {
                Color(.secoundaryOrange)
                
                VStack {
                    Text("Oppdag mer:")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack {
                            
                            ForEach(ClothingType.allCases) {
                                clothingType in
                                
                                Button {
                                    didTap(clothingType: clothingType)
                                } label: {
                                    Text("\(clothingType.rawValue)")
                                }
                            }
                        }
                        .fontWeight(.bold)
                    }
                    .padding(.leading)
                }
                .foregroundStyle(.white)
            }
            
            productCategoryList
            
                .sheet(isPresented: $isShowingSheet, content: {
                    Text("Sheet is showing \(selectedClothingType)")
                })
        }
        
    } // body
    
    var productCategoryList: some View {
        ZStack {
            Color.white
            VStack {
                Text("Hvem shopper du til?")
                Text("Gutt, jente eller baby")
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Button(action: {
                            print("trykket baby 0-12 mnd")
                        }, label: {
                            ZStack {
                                VStack//(spacing: 0)
                                {
                                    Image("baby")
                                        //.resizable()
                                    ZStack {
                                        Color.blue
                                        Text("Baby (0-12 måneder)")
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                        })
                        
                        Button(action: {
                            print("trykket gutt (1-3 år)")
                        }, label: {
                            ZStack {
                                VStack// (spacing: 0)
                                {
                                    Image("youngBoy")
                                    
                                    ZStack {
                                        Color.green
                                        Text("Gutt (1-3 år)")
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                        })
                        
                        Button(action: {
                            print("trykket jente (1-3 år)")
                        }, label: {
                            ZStack {
                                VStack//(spacing: 0)
                                {
                                    Image("youngGirl")
                                    ZStack {
                                        Color.red
                                        Text("Jente (1-3 år)")
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                        })
                    }
                }
            }
        }
    }
}


#Preview {
    HomeView()
}
