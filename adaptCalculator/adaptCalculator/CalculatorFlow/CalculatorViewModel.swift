//
//  CalculatorViewModel.swift
//  adaptCalculator
//
//  Created by OnlyFrenzy on 06.10.2020.
//

import UIKit


class CalculatorViewModel {
    
    var calculatorService = CalculatorService()
    var currentValueValidator = CurrentValueValidator()
    var numberHaveDot = false
    var currentValue: String = "0" {
        didSet {
            displayDelegate?.showCurrentValue(value: currentValue)
        }
    }
    
//    private enum mathSigns: Character {
//        case plus = "+"
//        case minus = "-"
//        case multiply = "✕"
//        case division = "÷"
//    }
    
    weak var displayDelegate: CalculatorDisplayDelegate?
    
    func signButtonColor() -> UIColor {
        return .black
    }
    
    func onClickNumberButton(number: Int) {
        let lastSimbolInCurrentValue = currentValue[currentValue.index(before: currentValue.endIndex)]
        if currentValue == "0" {
            currentValue = String(number)
        } else if lastSimbolInCurrentValue != ")" {
            currentValue += String(number)
        }
    }
    
    func onClickSqrtButton() {
        if currentValue == "0" {
            currentValue = "√"
        } else {
            let lastSimbolInCurrentValue = currentValue[currentValue.index(before: currentValue.endIndex)]
            if lastSimbolInCurrentValue != "√" && (lastSimbolInCurrentValue == "+" || lastSimbolInCurrentValue == "-" || lastSimbolInCurrentValue == "✕" || lastSimbolInCurrentValue == "÷")/* енаму mathSigns */ {
                currentValue += "√"}
        }
        
    }
    
    func onClickDotButton() { //не знаю, что делать с точкой т.к он дает ее поставить только если больше нет точек, если есть то не дает, а если 2 числа дробных??
        if !numberHaveDot {
            let lastSimbolInCurrentValue = currentValue[currentValue.index(before: currentValue.endIndex)]
            if lastSimbolInCurrentValue == "√" || lastSimbolInCurrentValue == "÷" || lastSimbolInCurrentValue == "✕" || lastSimbolInCurrentValue == "-" || lastSimbolInCurrentValue == "+" || lastSimbolInCurrentValue == "(" || lastSimbolInCurrentValue == ")"{
                currentValue += "0."
            } else if currentValue == "0"{
                currentValue = "0."
            } else {
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
    
    func onClickPlusButton() {
        let lastSimbolInCurrentValue = currentValue[currentValue.index(before: currentValue.endIndex)]
        if lastSimbolInCurrentValue != "(" && lastSimbolInCurrentValue != "+" && lastSimbolInCurrentValue != "-" && lastSimbolInCurrentValue != "✕" && lastSimbolInCurrentValue != "÷" && lastSimbolInCurrentValue != "√"/* енаму mathSigns */ {
            currentValue += "+"}
        numberHaveDot = false
    }
    
    func onClickBracketsButton() {
        if currentValue == "0" {
            currentValue = "("
        } else {
            let lastSimbolInCurrentValue = currentValue[currentValue.index(before: currentValue.endIndex)]
            if  currentValue.contains("(") && !currentValue.contains(")") {
                if lastSimbolInCurrentValue == "(" {
                    currentValue += "0"
                }
                currentValue += ")"
            }
            if (lastSimbolInCurrentValue == "+" || lastSimbolInCurrentValue == "-" || lastSimbolInCurrentValue == "✕" || lastSimbolInCurrentValue == "÷" && lastSimbolInCurrentValue != "√") && !currentValue.contains("("){
                currentValue += "("
            }
        }
    }
    
    func onClickMinusButton() {
        let lastSimbolInCurrentValue = currentValue[currentValue.index(before: currentValue.endIndex)]
        if lastSimbolInCurrentValue != "(" && lastSimbolInCurrentValue != "+" && lastSimbolInCurrentValue != "-" && lastSimbolInCurrentValue != "✕" && lastSimbolInCurrentValue != "÷" && lastSimbolInCurrentValue != "√"/* енаму mathSigns */ {
            currentValue += "-"}
        numberHaveDot = false
    }
    
    func onClickCalculateButton() {
        let lastSimbolInCurrentValue = currentValue[currentValue.index(before: currentValue.endIndex)]
        if (lastSimbolInCurrentValue.isNumber || lastSimbolInCurrentValue == ")") && lastSimbolInCurrentValue != "+" && lastSimbolInCurrentValue != "-" && lastSimbolInCurrentValue != "✕" && lastSimbolInCurrentValue != "÷" && lastSimbolInCurrentValue != "√"/* енаму mathSigns */ {
            
            let verifiedValue = currentValueValidator.validateSignEqual(inputString: currentValue)
            
            if let result = calculatorService.calculate(inputString: verifiedValue) {
                currentValue += " = \(result)"
            }
        }
    }
    
    func onClickDivisionButton() {
        let lastSimbolInCurrentValue = currentValue[currentValue.index(before: currentValue.endIndex)]
        if lastSimbolInCurrentValue != "(" && lastSimbolInCurrentValue != "+" && lastSimbolInCurrentValue != "-" && lastSimbolInCurrentValue != "✕" && lastSimbolInCurrentValue != "÷" && lastSimbolInCurrentValue != "√"/* енаму mathSigns */ {
            currentValue += "÷"}
        numberHaveDot = false
    }
    
    func onClickMultButton() {
        let lastSimbolInCurrentValue = currentValue[currentValue.index(before: currentValue.endIndex)]
        if lastSimbolInCurrentValue != "(" && lastSimbolInCurrentValue != "+" && lastSimbolInCurrentValue != "-" && lastSimbolInCurrentValue != "✕" && lastSimbolInCurrentValue != "÷" && lastSimbolInCurrentValue != "√"/* енаму mathSigns */ {
            currentValue += "✕"}
        numberHaveDot = false
    }
}
