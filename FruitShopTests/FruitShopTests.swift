//
//  FruitShopTests.swift
//  FruitShopTests
//
//  Created by Joseph Quesne on 15/03/2020.
//  Copyright © 2020 JQ. All rights reserved.
//

import XCTest
@testable import FruitShop

class FruitShopTests: XCTestCase {

    let shoppingViewModel = ShoppingViewModel()
    
    func testEmptyBasket() {
        XCTAssertEqual(shoppingViewModel.getTotalPrice(), 0)
    }
    
    func testSingleFruit() {
        // 1 Apple
        shoppingViewModel.addFruitsToBasket(fruits: [Fruit.apple])
        XCTAssertEqual(shoppingViewModel.getTotalPrice(), 0.6)
        
        // 1 Orange
        shoppingViewModel.emptyBasket()
        shoppingViewModel.addFruitToBasket(fruit: Fruit.orange, quantity: 1)
        XCTAssertEqual(shoppingViewModel.getTotalPrice(), 0.25)
        
        // Clear basket
        shoppingViewModel.emptyBasket()
        XCTAssertEqual(shoppingViewModel.getTotalPrice(), 0)
    }
    
    func testMultipleFruit() {
        // 3 apples, 1 orange
        shoppingViewModel.addFruitsToBasket(fruits: [Fruit.apple, Fruit.apple, Fruit.orange, Fruit.apple])
        XCTAssertEqual(shoppingViewModel.getTotalPrice(), 2.05)
        
        // 2 apples, 6 oranges
        shoppingViewModel.emptyBasket()
        shoppingViewModel.addFruitToBasket(fruit: Fruit.apple, quantity: 2)
        shoppingViewModel.addFruitToBasket(fruit: Fruit.orange, quantity: 6)
        XCTAssertEqual(shoppingViewModel.getTotalPrice(), 2.7)
        
        // Clear basket
        shoppingViewModel.emptyBasket()
        XCTAssertEqual(shoppingViewModel.getTotalPrice(), 0)
    }
}
