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
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //Что произойдет когда будет нажата цифра или точка на клавиатуре
        //извлекаем текст из нажатой кнопки
        if let numValue = sender.currentTitle {
            //извлекаем текст из надписи
            if let displayText = displayLabel.text {
                //если в надписи всего один символ
                if displayText.count == 1 {
                    //если нажатая кнопка - это не точка
                    if numValue != "." {
                        //если в надписи единственный символ не 0
                        if displayText != "0" {
                            //до добавляем новую цифру
                            displayLabel.text = displayText + numValue
                        } else {
                            //а если в надписи только ноль, то заменяем его новой цифрой
                            displayLabel.text = numValue
                        }
                    } else {
                        //а если нажата точка, то добавляем "."
                        displayLabel.text = displayText + "."
                    }
                } else {
                    //а если в надписи не один символ
                    //если нажатая кнопка - это не точка
                    if numValue != "." {
                        //то просто добавляем эту цифру в надпись
                        displayLabel.text = displayText + numValue
                    } else {
                        //а если нажата точка, то
                        //если в тексте еще нет точки
                        if !displayText.contains(".") {
                            //то добавляем ее в конец строки
                            displayLabel.text = displayText + "."
                        }
                    }

                }
            }
            
        }
    }

}

