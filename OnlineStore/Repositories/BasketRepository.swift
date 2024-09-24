//
//  BasketRepository.swift
//  OnlineStore
//
//  Created by Karima Thingvold on 24/09/2024.
//

import Foundation

class BasketRepository {

    private var basket = [Product]()

    func getBasket() -> [Product] {
        return basket
    }

    func addToBasket(_ product: Product) {
        basket.append(product)
    }

    func removeFromBasket(_ product: Product) {
        guard let index = basket.firstIndex(of: product) else { return }
        basket.remove(at: index)
    }

    func clearBasket() {
        basket = []
    }

}
