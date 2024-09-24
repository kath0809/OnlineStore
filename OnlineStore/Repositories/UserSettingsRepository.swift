//
//  UserSettingsRepository.swift
//  OnlineStore
//
//  Created by Karima Thingvold on 24/09/2024.
//

import Foundation

// Storing persistent data
//
// * Documents folder
// * UserDefaults
// * CoreData / SwiftData
// * Keychain
// * AppGroup

struct UserSettingsRepository {

    static let userSettingsKey = "userSettingsKey"

    func get() -> UserSettings {
        guard let data = UserDefaults.standard.data(forKey: Self.userSettingsKey) else {
            return UserSettings(preferedClothingCategory: .woman)
        }
        // We would need some proper error management instead of the ’try?’
        let decoded = try? PropertyListDecoder().decode(UserSettings.self, from: data)
        return decoded ?? UserSettings(preferedClothingCategory: .woman)
    }

    func save(userSettings: UserSettings) {
        do {
            let encoded = try PropertyListEncoder().encode(userSettings)
            UserDefaults.standard.set(encoded, forKey: Self.userSettingsKey)
        } catch {
            print("error")
        }
    }
}
