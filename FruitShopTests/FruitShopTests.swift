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
    
    //MARK: - Properties
    let shoppingViewModel = ShoppingViewModel()
    
    //MARK: - Test Original Price (Before Promotion)
    func testEmptyBasketOriginalPrice() {
        XCTAssertEqual(shoppingViewModel.getTotalPriceOriginal(), 0)
    }
    
    func testSingleFruitOriginalPrice() {
        // 1 Apple
        shoppingViewModel.addFruitsToBasket(fruits: [.apple])
        XCTAssertEqual(shoppingViewModel.getTotalPriceOriginal(), 0.6)
        
        // 1 Orange
        shoppingViewModel.emptyBasket()
        shoppingViewModel.addFruitToBasket(fruit: .orange, quantity: 1)
        XCTAssertEqual(shoppingViewModel.getTotalPriceOriginal(), 0.25)
        
        // Clear basket
        shoppingViewModel.emptyBasket()
        XCTAssertEqual(shoppingViewModel.getTotalPriceOriginal(), 0)
    }
    
    func testMultipleFruitOriginalPrice() {
        // 3 apples, 1 orange
        shoppingViewModel.addFruitsToBasket(fruits: [.apple, .apple, .orange, .apple])
        XCTAssertEqual(shoppingViewModel.getTotalPriceOriginal(), 2.05)
        
        // 2 apples, 6 oranges
        shoppingViewModel.emptyBasket()
        shoppingViewModel.addFruitToBasket(fruit: .apple, quantity: 2)
        shoppingViewModel.addFruitToBasket(fruit: .orange, quantity: 6)
        XCTAssertEqual(shoppingViewModel.getTotalPriceOriginal(), 2.7)
        
        // Clear basket
        shoppingViewModel.emptyBasket()
        XCTAssertEqual(shoppingViewModel.getTotalPriceOriginal(), 0)
    }
    
    //MARK: - Test Promotion Price
    func testEmptyBasketPromotionPrice() {
        XCTAssertEqual(shoppingViewModel.getTotalPriceAfterPromotions(), 0)
    }
    
    func testSingleFruitPromotionPrice() {
        // 1 Apple (0 free)
        shoppingViewModel.addFruitsToBasket(fruits: [.apple])
        XCTAssertEqual(shoppingViewModel.getTotalPriceAfterPromotions(), 0.6)
        
        // 1 Orange (0 Free)
        shoppingViewModel.emptyBasket()
        shoppingViewModel.addFruitToBasket(fruit: .orange, quantity: 1)
        XCTAssertEqual(shoppingViewModel.getTotalPriceAfterPromotions(), 0.25)
        
        // Clear basket
        shoppingViewModel.emptyBasket()
        XCTAssertEqual(shoppingViewModel.getTotalPriceAfterPromotions(), 0)
    }
    
    func testMultipleFruitPromotionPrice() {
        // 3 apples (1 Free), 1 orange (0 Free)
        shoppingViewModel.addFruitsToBasket(fruits: [.apple, .apple, .orange, .apple])
        XCTAssertEqual(shoppingViewModel.getTotalPriceAfterPromotions(), 1.45)
        
        // 1 apples (0 Free), 3 oranges (1 Free)
        shoppingViewModel.emptyBasket()
        shoppingViewModel.addFruitsToBasket(fruits: [.orange, .orange, .orange, .apple])
        XCTAssertEqual(shoppingViewModel.getTotalPriceAfterPromotions(), 1.10)
        
        // 2 apples (1 Free), 6 oranges (2 Free)
        shoppingViewModel.emptyBasket()
        shoppingViewModel.addFruitToBasket(fruit: .apple, quantity: 2)
        shoppingViewModel.addFruitToBasket(fruit: .orange, quantity: 6)
        XCTAssertEqual(shoppingViewModel.getTotalPriceAfterPromotions(), 1.6)
        
        // 4 apples (2 Free), 12 oranges (4 Free)
        shoppingViewModel.emptyBasket()
        shoppingViewModel.addFruitToBasket(fruit: .apple, quantity: 4)
        shoppingViewModel.addFruitToBasket(fruit: .orange, quantity: 12)
        XCTAssertEqual(shoppingViewModel.getTotalPriceAfterPromotions(), 3.2)

        // Clear basket
        shoppingViewModel.emptyBasket()
        XCTAssertEqual(shoppingViewModel.getTotalPriceAfterPromotions(), 0)
    }
}
