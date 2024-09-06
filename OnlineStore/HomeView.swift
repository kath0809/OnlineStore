    //
    //  HomeView.swift
    //  OnlineStore
    //
    //  Created by Karima Thingvold on 06/09/2024.
    //

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            ZStack {
                Color.orange
                VStack {
                    Text("Kickstart høsten")
                    Text("Spar opptil 50% på tusenvis av varer")
                }
            }
            
            ZStack {
                Color.brown
                Text("Oppdag mer:")
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Button(action: {
                            print("Trykket knappen klær")
                        }, label: {
                            Text("Klær")
                        })
                        
                        Button(action: {
                            print("Trykket knappen sko")
                            
                        }, label: {
                            Text("Sko")
                        })
                    }
                }
            }
            
            productCategoryList
            
            
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
                                VStack(spacing: 0) {
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
                                VStack(spacing: 0) {
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
                                VStack(spacing: 0) {
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
