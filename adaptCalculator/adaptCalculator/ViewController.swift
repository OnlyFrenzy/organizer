//
//  ViewController.swift
//  adaptCalculator
//
//  Created by OnlyFrenzy on 03.10.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    var stillTyping = false
    var firstOperand:Double = 0
    var secondOperand:Double = 0
    var operationSign = ""
    var dotIsPlased = false
    var currentInput:Double {
        get{
            return Double(displayLabel.text!)!
        }
        set{
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0"{
                displayLabel.text = "\(valueArray[0])"
            }
            else{
                displayLabel.text = "\(newValue)"
            }
            
            stillTyping = false
        }
    }
    
    @IBAction func numbersBotton(_ sender: UIButton) {
        let number = sender.currentTitle!
        
        if stillTyping == true {
        if displayLabel.text!.count < 20 {
            displayLabel.text = displayLabel.text! + number
        }
        } else {
            displayLabel.text = number
            stillTyping = true
        }
        
    }
    
    @IBAction func twoOperandSignButton(_ sender: UIButton) {
        operationSign = sender.currentTitle!
        firstOperand = currentInput
        stillTyping = false
        dotIsPlased = false
    }
    
    func operateWithTwoOperand(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        stillTyping = false
    }
    
    @IBAction func equallytySignButton(_ sender: UIButton) {
        if stillTyping == true{
            secondOperand = currentInput
        }
        
        dotIsPlased = false
        
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
    }
    
    
    @IBAction func clearButton(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        displayLabel.text = "0"
        stillTyping = false
        operationSign = ""
        dotIsPlased = false
    }
    
    @IBAction func plusMinusButton(_ sender: UIButton) {
        currentInput = -currentInput
    }
    
    @IBAction func percentButton(_ sender: UIButton) {
        if firstOperand == 0{
            currentInput = currentInput / 100
        }
        else {
            secondOperand = firstOperand * currentInput / 100
        }
    }
    
    @IBAction func dotButton(_ sender: UIButton) {
        if stillTyping && !dotIsPlased{
            displayLabel.text = displayLabel.text! + "."
            dotIsPlased = true
        }
        else if !stillTyping && !dotIsPlased{
            displayLabel.text = "0."
        }
        
    }
    
    @IBAction func squareRootButton(_ sender: UIButton) {
        currentInput = sqrt(currentInput)
    }
}


