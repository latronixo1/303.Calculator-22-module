//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    //флаг законченности набора цифр (необходимо набирать новую строку). Будет устанавливаться в true при нажатии на операцию (сложения, умножения) для начала набора новой цифры
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double")
            }
            return number
        }
        set  {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()

    //What should happen when a non-number button is pressed
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            guard let result = calculator.calculate(symbol: calcMethod) else { fatalError("Thr result of the calculation is nil")}
            displayValue = result

        }
        
    }

    //Что произойдет когда будет нажата цифра или точка на клавиатуре
    @IBAction func numButtonPressed(_ sender: UIButton) {

        //извлекаем текст из нажатой кнопки
        if let numValue = sender.currentTitle {
            //если мы начинаем набирать новое число
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                //убираем флаг новой строки
                isFinishedTypingNumber = false
            } else {
                
                //следующая конструкция необходима для предотвращения повтоного ввода разделителя дробной части числа "."
                if numValue == "." {
                    //если написанное число равно ему же, но округленному в меньшую сторону
                    //иначе говоря если написанное число не содержит точки ".",
                    //иначе говоря если написанное число является целым числом,
                    //то устанавливаем isInt (это наш флаг целочисленности написанного числа) в true
                    let isInt = floor(displayValue) == displayValue
                    
                    //если написанное число не Int, то больше ничего не делаем
                    if !isInt {
                        return
                    }
                }
                //если компилятор дошел до этой строки, значит в написанном точки нет, значит дописываем точку
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }

}

