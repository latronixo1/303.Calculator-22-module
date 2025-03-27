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
    
    //What should happen when a non-number button is pressed
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert display label text to a Double")
        }
        
        if let calcMethod = sender.currentTitle {
            switch calcMethod {
            case "AC":
                displayLabel.text = "0"
            case "+/-":
                displayLabel.text = String(number * -1)
            case "%":
                displayLabel.text = String(number / 100)
            default:
                displayLabel.text = "Unknown button pressed"
            }
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
                    //безопасно преобразовываем опциональную строку в Double
                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                        fatalError("Cannot convert display label text to a Double!")
                    }
                    //если написанное число равно ему же, но округленному в меньшую сторону
                    //иначе говоря если написанное число не содержит точки ".",
                    //иначе говоря если написанное число является целым числом,
                    //то устанавливаем isInt (это наш флаг целочисленности написанного числа) в true
                    let isInt = floor(currentDisplayValue) == currentDisplayValue
                    
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

