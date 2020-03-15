//
//  ShoppingViewModel.swift
//  FruitShop
//
//  Created by Joseph Quesne on 15/03/2020.
//  Copyright © 2020 JQ. All rights reserved.
//

import Foundation

class ShoppingViewModel {
    
    // MARK: - Properties
    var fruitBasket: [Fruit] = []
    
    // Add a combination of different fruits (e.g. [Fuit.apple, Fruit.orange])
    func addFruitsToBasket(fruits:[Fruit]) {
        fruitBasket.append(contentsOf: fruits)
    }
    
    // Add a particular fruit x number of times
    func addFruitToBasket(fruit:Fruit, quantity:Int) {
        if quantity < 1 { return }
        for _ in 1...quantity {
            fruitBasket.append(fruit)
        }
    }
    
    func emptyBasket() {
        fruitBasket = []
    }
    
    func getTotalPrice() -> Double {
        return fruitBasket.reduce(0) { $0 + $1.price }
    }
}
