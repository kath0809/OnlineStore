    //
    //  HomeView.swift
    //  OnlineStore
    //
    //  Created by Karima Thingvold on 06/09/2024.
    //

import Foundation
import SwiftUI

struct HomeView: View {
    
    @State var isShowingSheet = false
    
    @State var selectedClothingType: ClothingType = .klær
    
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
//                            .font(.largeTitle)
//                            .fontWeight(.bold)
                            .rainbowStyle()
                        
                        Text("Spar opptil 50% på tusenvis av varer")
                            .font(.title)
                    }
                    .padding(.leading)
                    Spacer()
                    
                }
            }
            .foregroundStyle(.white)
            .frame(height: 160)
            
            
            
            ZStack {
                Color("SecondaryOrange")
                
                VStack {
                    Text("Oppdag mer:")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(ClothingType.allCases) {
                                clothingType in
                                
                                Button(action: {
                                    didTap(clothingType: clothingType)
                                }, label: {
                                    
                                    Text("\(clothingType.rawValue)")
                                })
                            }
                        }
                        .fontWeight(.bold)
                    }
                    .padding(.leading)
                }
                .foregroundStyle(.white)
            }
            
            productCategoryList
            
            
        }
        .sheet(isPresented: $isShowingSheet, content: {
            
            ProductView(selectedClothingType: selectedClothingType)
            
        })
        
    }
    
        // body
    
    var productCategoryList: some View {
        ZStack {
            Color.white
            VStack {
                Text("Hvem shopper du til?")
                Text("Gutt, jente eller baby")
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Button(action: {
                            print("trykka baby 0-12 mnd")
                        }, label: {
                            ZStack {
                                VStack {
                                    
                                    Image("baby")
                                    ZStack {
                                        Color.blue
                                        Text("Baby (0-12 måneder)")
                                            .foregroundStyle(.white)
                                    }
                                }
                                
                            }
                        })
                        
                        
                        Button(action: {
                            print("trykka jente (1-3 år)")
                        }, label: {
                            ZStack {
                                VStack {
                                    
                                    Image("youngGirl")
                                    ZStack {
                                        Color.red
                                        Text("Jente (1-3 år)")
                                            .foregroundStyle(.white)
                                    }
                                }
                                
                            }
                        })
                        
                        Button(action: {
                            print("trykket gutt (1-3 år)")
                        }, label: {
                            ZStack {
                                VStack {
                                    
                                    Image("youngBoy")
                                    ZStack {
                                        Color.green
                                        Text("Gutt (1-3 år)")
                                            .foregroundStyle(.white)
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
