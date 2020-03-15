//
//  Promotion.swift
//  FruitShop
//
//  Created by Joseph Quesne on 15/03/2020.
//  Copyright © 2020 JQ. All rights reserved.
//

import Foundation

enum Promotion: CaseIterable {
    
    case buyOneGetOneFree
    case threeForTwo
    
    var fruit: Fruit {
        switch self {
        case .buyOneGetOneFree: return .apple
        case .threeForTwo: return .orange
        }
    }
    
    var divideBy: Double {
        switch self {
        case .buyOneGetOneFree: return 2
        case .threeForTwo: return 1.5
        }
    }
}
