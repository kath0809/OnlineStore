//
//  Search.swift
//  OnlineStore
//
//  Created by Karima Thingvold on 24/09/2024.
//

import Foundation
import UIKit

struct SearchRepository {

    func fetchSearchResults() async -> [Product] {

        guard let jsonData = NSDataAsset(name: "SearchResults")?.data else {
            return []
        }
        do {
            let decodeProducts = try JSONDecoder().decode(SearchResponse.self, from: jsonData)

            return decodeProducts.results
        } catch {
            print(error)
        }
        return []
    }

}
