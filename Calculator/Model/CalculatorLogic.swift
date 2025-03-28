//
//  CalculatorLogic.swift
//  303.Calculator
//
//  Created by Валентин Картошкин on 27.03.2025.
//  Copyright © 2025 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    func calculate (symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-": return n * -1
            case "AC": return 0
            case "%": return n / 100
            default: return nil
            }
        }
         return nil
    }
    
}
