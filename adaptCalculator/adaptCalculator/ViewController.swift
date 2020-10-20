//
//  ViewController.swift
//  adaptCalculator
//
//  Created by OnlyFrenzy on 03.10.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!//почитать про weak
    
    var isStillTyping = false
    var firstOperand:Double = 0
    var secondOperand:Double = 0
    var operationSign = ""
    var isDotPlased = false
    var currentInput: Double = 0 {
        didSet {
            let value = "\(currentInput)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0" {
                displayLabel.text = "\(valueArray[0])"
            }
            else {
                displayLabel.text = "\(currentInput)"
            }
            
            isStillTyping = false
        }
    }
    
    @IBAction func numbersBotton(_ sender: UIButton) {//почему подчеркивание перед sender
        guard let number = sender.currentTitle else { return } //форсанврап +
        if isStillTyping == true {
            guard let displayLabelTextCount = displayLabel.text?.count,
                  let displayLabelText = displayLabel.text else { return }
              
            if displayLabelTextCount < 20 { //форсанврап x2 ++
                displayLabel.text = displayLabelText + number
            }
        }
        else {
            displayLabel.text = number
            isStillTyping = true
        }
        
    }
    
    @IBAction func twoOperandSignButton(_ sender: UIButton) {
        guard let currentTitle = sender.currentTitle else {return}
        operationSign = currentTitle // форсанврап +
        firstOperand = currentInput
        isStillTyping = false
        isDotPlased = false
    }
    
    /*func calculateOperateWithTwoOperand(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        isStillTyping = false
    }*/
    func operateWithTwoOperand(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        isStillTyping = false
    }
    
    @IBAction func equallytySignButton(_ sender: UIButton) {
        if isStillTyping == true{
            secondOperand = currentInput
        }
        
        isDotPlased = false
        
        switch operationSign {
        case "+":
            operateWithTwoOperand{$0 + $1}
        case "-":
            operateWithTwoOperand{$0 - $1}
        case "✕":
            operateWithTwoOperand{$0 * $1}
        case "÷":
            operateWithTwoOperand{$0 / $1}
        default: break
        }
            //написать в енаме функцию которая берет 2 дабла и выдает один и через роувэлью реализовать свич между тем, что было передано с кнопки
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        displayLabel.text = "0"
        isStillTyping = false
        operationSign = ""
        isDotPlased = false
    }
    
    @IBAction func plusMinusButton(_ sender: UIButton) {
        currentInput = -currentInput
    }
    
    @IBAction func percentButton(_ sender: UIButton) {
        let percentsOfNumber = currentInput / 100
        if firstOperand == 0 {
            currentInput = percentsOfNumber
        }
        else {
            secondOperand = firstOperand * percentsOfNumber
        }
    }
    
    @IBAction func dotButton(_ sender: UIButton) {
        if isStillTyping && !isDotPlased {
            guard let displayLabelText = displayLabel.text else {return}
            displayLabel.text = displayLabelText + "."
            isDotPlased = true
        }
        else if !isStillTyping && !isDotPlased {
            displayLabel.text = "0."
        }
        
    }
    
    @IBAction func squareRootButton(_ sender: UIButton) {
        currentInput = sqrt(currentInput)
    }
}

