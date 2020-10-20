//
//  CalculatorValidator.swift
//  adaptCalculator
//
//  Created by OnlyFrenzy on 20.10.2020.
//

import Foundation


class CalculatorValidator {


    private let openBracket = "("
    private let closeBracket = ")"


    func validateBinarySign (inputString: String) -> Bool {
        let lastSimbolInputString = inputString[inputString.index(before: inputString.endIndex)]
        if !(Sign(rawValue: String(lastSimbolInputString)) != nil) && lastSimbolInputString != openBracket {
            return true
        } else {
            return false
        }
    }
}

