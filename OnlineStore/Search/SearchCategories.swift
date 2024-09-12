//
//  SearchCategories.swift
//  OnlineStore
//
//  Created by Karima Thingvold on 11/09/2024.
//

import SwiftUI

struct SearchCategory: Identifiable, Equatable, Hashable {
    
    public var id: Self { return self }
    
    let name: String
    let systemImageName: String
    
    
    static var defaultCategories = [
        SearchCategory(name: "Nordisk Stil", systemImageName: "heart"),
        SearchCategory(name: "Nyheter", systemImageName: "star"),
        SearchCategory(name: "Klær", systemImageName: "figure.mixed.cardio")
    ]
    
    static var maleCategories = [
        SearchCategory(name: "Nyheter", systemImageName: "star"),
        SearchCategory(name: "Nordisk Stil", systemImageName: "heart"),
        SearchCategory(name: "Klær", systemImageName: "figure.mixed.cardio")
    ]
    
    static var childrenCategories = [
        SearchCategory(name: "Back to school", systemImageName: "heart"),
        SearchCategory(name: "Nyheter", systemImageName: "star"),
        SearchCategory(name: "Klær", systemImageName: "figure.mixed.cardio")
    ]
    
    static var babyCategories = [
        SearchCategory(name: "New born", systemImageName: "heart"),
        SearchCategory(name: "Nyheter", systemImageName: "star"),
        SearchCategory(name: "Klær", systemImageName: "figure.mixed.cardio")
    ]
    
}
