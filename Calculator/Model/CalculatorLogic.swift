//
//  CalculatorLogic.swift
//  303.Calculator
//
//  Created by Валентин Картошкин on 27.03.2025.
//  Copyright © 2025 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calculate (symbol: String) -> Double? {
    
        switch symbol {
        case "+/-": return number * -1
        case "AC": return 0
        case "%": return number / 100
        default: return 0
        }
       
    }
    
}
