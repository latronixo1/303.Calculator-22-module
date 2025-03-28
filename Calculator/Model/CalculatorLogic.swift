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
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate (symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-": return n * -1
            case "AC": return 0
            case "%": return n / 100
            case "=": return performTwoNumCalculation(n2: n)
            default: self.intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
         return nil
    }
    
    private mutating func performTwoNumCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+": return n1 + n2
            case "-": return n1 - n2
            case "×": return n1 * n2
            case "÷": return n1 / n2
            default: fatalError("The operation passed in does not match any of the cases")
            }
        } else {
            return nil
        }
    }
}
