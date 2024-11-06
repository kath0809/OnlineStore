//
//  OnlineStoreApp.swift
//  OnlineStore
//
//  Created by Karima Thingvold on 06/09/2024.
//

import SwiftUI
import SwiftData

@main
struct OnlineStoreApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                // Sett riktig database
                .modelContainer(sharedModelContainer)
        }
    }
}

var sharedModelContainer: ModelContainer = {
    
        /// Hvilke objekter skal være i databasen? Entity = Navnet på des
    let schema = Schema([Product.self, Supplier.self])
    
    let modelConfiguration = ModelConfiguration(schema: schema,isStoredInMemoryOnly: false)
    
    do {
        return try ModelContainer(for: schema, configurations: modelConfiguration)
    } catch {
        fatalError("Could not create model container: \(error.localizedDescription) schema: \(schema).")
    }
}()
