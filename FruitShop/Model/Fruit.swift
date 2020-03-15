//
//  Fruit.swift
//  FruitShop
//
//  Created by Joseph Quesne on 15/03/2020.
//  Copyright © 2020 JQ. All rights reserved.
//

import Foundation

enum Fruit {
    
    case apple
    case orange
    
    var name: String {
        switch self {
        case .apple:
            return "Apple"
        case .orange:
            return "Orange"
        }
    }
    
    var price: Double {
        switch self {
        case .apple:
            return 0.60
        case .orange:
            return 0.25
        }
    }
}
