//
//  CalculatorViewModel.swift
//  adaptCalculator
//
//  Created by OnlyFrenzy on 06.10.2020.
//

import UIKit


class CalculatorViewModel {
    
    var calculatorService = CalculatorService()
    var calculatorValidator = CalculatorValidator()
    var numberHaveDot = false
    var currentValue: String = "0" {
        didSet {
            displayDelegate?.showCurrentValue(value: currentValue)
        }
    }
    
    weak var displayDelegate: CalculatorDisplayDelegate?
    
    func signButtonColor() -> UIColor {
        return .black
    }
    
    func onClickNumberButton(number: Int) {
        let validateNumber = calculatorValidator.validateNumber(inputString: currentValue)
        if validateNumber == "empty" {
            currentValue = String(number)
        }
        if validateNumber == "true" {
            currentValue += String(number)
        }
    }
    
    func onClickDotButton() {
        if !numberHaveDot {
            let validateDot = calculatorValidator.validateDot(inputString: currentValue)
            if validateDot == "sign" {
                currentValue += "0."
                
            }
            if validateDot == "empty" {
                currentValue = "0."
            }
            if validateDot == "number" {
                currentValue += "."
            }
        }
        numberHaveDot = true
    }
    
    func onClickClearButton() {
        currentValue = "0"
        numberHaveDot = false
    }
    
    func onClickChangeSignButton() {
        if currentValue.first == "-" {
            currentValue.remove(at: currentValue.startIndex)
        } else {
            currentValue.insert("-", at: currentValue.startIndex)
        }
    }
    
    func onClickBracketsButton() {
        if !numberHaveDot {
            let validateBrackets = calculatorValidator.validateBrackets(inputString: currentValue)
            if validateBrackets == "empty" {
                currentValue = "("
            }
            if validateBrackets == "open" {
                currentValue += "("
                
            }
            if validateBrackets == "close" {
                currentValue += ")"
            }
        }
    }
    
    func onClickPlusButton() {
        let validateBinarySign = calculatorValidator.validateBinarySign(inputString: currentValue)
        
        if validateBinarySign { currentValue += "+" }
        numberHaveDot = false
    }
    
    func onClickMinusButton() {
        let validateBinarySign = calculatorValidator.validateBinarySign(inputString: currentValue)
        
        if validateBinarySign { currentValue += "-" }
        numberHaveDot = false
    }
    
    func onClickDivisionButton() {
        let validateBinarySign = calculatorValidator.validateBinarySign(inputString: currentValue)
        
        if validateBinarySign { currentValue += "÷" }
        numberHaveDot = false
    }
    
    func onClickMultButton() {
        let validateBinarySign = calculatorValidator.validateBinarySign(inputString: currentValue)
        
        if validateBinarySign { currentValue += "✕" }
        numberHaveDot = false
    }
    
    func onClickSqrtButton() {
        let validateSqrt = calculatorValidator.validateSqrt(inputString: currentValue)
        
        if validateSqrt == "empty" {
            currentValue = "√"
        }
        if validateSqrt == "true" {
            currentValue += "√"
        }
    }
    
    func onClickCalculateButton() {
        var validateCalculate = calculatorValidator.validateCalculate(inputString: currentValue)
        while validateCalculate != "true" && validateCalculate != "empty" {
            currentValue.removeLast()
            validateCalculate = calculatorValidator.validateCalculate(inputString: currentValue)
        }
        if validateCalculate == "empty" {
            currentValue = "0"
        }
        if validateCalculate == "true" {
            let verifiedValue = calculatorValidator.equalSignYet(inputString: currentValue)
            if let result = calculatorService.calculate(inputString: verifiedValue) {
                currentValue = verifiedValue + " = \(result)"
            }
        }
    }
}
