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
    
    // MARK: - Basket Methods
    func emptyBasket() {
        fruitBasket = []
    }
    
    // Add a combination of different fruits (e.g. [.apple, .orange, .orange])
    func addFruitsToBasket(fruits:[Fruit]) {
        fruitBasket.append(contentsOf: fruits)
    }
    
    // Add a particular fruit (e.g Apple) X number of times
    func addFruitToBasket(fruit:Fruit, quantity:Int) {
        if quantity < 1 { return }
        for _ in 1...quantity {
            fruitBasket.append(fruit)
        }
    }
    
    // Get the quantity of a particular fruit (e.g Apples) in the fruitBasket
    func getBasketFruitQuantity(fruit:Fruit) -> Int {
        return fruitBasket.filter{ $0 == fruit }.count
    }
    
    // MARK: - Price Methods
    func getTotalPriceOriginal() -> Double {
        return fruitBasket.reduce(0) { $0 + $1.price }
    }
    
    // Apply promotions and get the new total price
    func getTotalPriceAfterPromotions() -> Double {
        var fruitBasketAfterPromotions: [Fruit] = []    // Fruit basket after promotion i.e with free fruits removed
        for fruit in Fruit.allCases {
            let totalFruitInBasket = getBasketFruitQuantity(fruit: fruit)
            if totalFruitInBasket < 1 { continue }

            for promotion in Promotion.allCases {
                if promotion.fruit == fruit
                {
                    // Remove free fruit after promotion
                    let paidFruitAmount = Int((Double(totalFruitInBasket) / promotion.divideBy).rounded(.up))
                    for _ in 1...paidFruitAmount {
                        fruitBasketAfterPromotions.append(fruit)
                    }
                }
            }
        }
        return fruitBasketAfterPromotions.reduce(0) { $0 + $1.price }
    }
}
