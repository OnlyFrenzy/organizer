//
//  CalculatorValidator.swift
//  adaptCalculator
//
//  Created by OnlyFrenzy on 20.10.2020.
//

import Foundation


class CalculatorValidator {


    private let openBracket: Character = "("
    private let closeBracket: Character = ")"
    private let dot: Character = "."
    private var openBracketYet = false

    func validateBinarySign (inputString: String) -> Bool {
        let lastSimbolInputString = inputString[inputString.index(before: inputString.endIndex)]
        if !(Sign(rawValue: String(lastSimbolInputString)) != nil) && lastSimbolInputString != openBracket {
            return true
        } else {
            return false
        }
    }
    
    func validateNumber(inputString: String) -> String {
        let lastSimbolInputString = inputString[inputString.index(before: inputString.endIndex)]
        if inputString == "0" {
            return "empty"
        }
        if lastSimbolInputString != closeBracket {
            return "true"
        } else {
            return "closeBracket"
        }
    }
    
    func validateDot(inputString: String) -> String {
        let lastSimbolInputString = inputString[inputString.index(before: inputString.endIndex)]
        if  inputString == "0" {
            return "empty"
        }
        if (Sign(rawValue: String(lastSimbolInputString)) != nil) || lastSimbolInputString == openBracket {
            return "sign"
        }
        if lastSimbolInputString.isNumber {
            return "number"
        } else {
            return "closeBracket"
        }
    }
    
    func validateSqrt(inputString: String) -> String {
        let lastSimbolInputString = inputString[inputString.index(before: inputString.endIndex)]
        if inputString == "0" {
            return "empty"
        }
        if String(lastSimbolInputString) == Sign.squareRoot.rawValue || lastSimbolInputString == closeBracket || lastSimbolInputString == dot || lastSimbolInputString.isNumber {
            return "false"
        } else {
            return "true"
        }
    }
    
    func validateBrackets(inputString: String) -> String {
        let lastSimbolInputString = inputString[inputString.index(before: inputString.endIndex)]
        if inputString == "0" {
            return "empty"
        }
        if (Sign(rawValue: String(lastSimbolInputString)) != nil) && openBracketYet == false {
            openBracketYet = true
            return "open"
        }
        if !(Sign(rawValue: String(lastSimbolInputString)) != nil) && openBracketYet == true {
            openBracketYet = false
            return "close"
        } else {
            return "false"
        }
    }
    
    func validateCalculate(inputString: String) -> String {
        if inputString == "0" || inputString == "" {
            return "empty"
        } else {
            let lastSimbolInputString = inputString[inputString.index(before: inputString.endIndex)]
            if (Sign(rawValue: String(lastSimbolInputString)) != nil) || lastSimbolInputString == openBracket {
                return "sign"
            }
            if lastSimbolInputString == closeBracket {
                let preLastSimbolInputString = inputString[inputString.index(before: inputString.index(before: inputString.endIndex))]
                if preLastSimbolInputString.isNumber || preLastSimbolInputString == dot {
                    return "true"
                }
            }
            return "true"
        }
    }
    
    func equalSignYet(inputString: String) -> String {
        var returnString = inputString
        if inputString.contains("=") {
            let valueAfterEqual = inputString.components(separatedBy: "=")
            returnString = valueAfterEqual[1]
        }
        return returnString
    }
}

