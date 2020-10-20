//
//  CalculatorValidator.swift
//  adaptCalculator
//
//  Created by OnlyFrenzy on 14.10.2020.
//

import Foundation


class CurrentValueValidator {
    
    func validateSignEqual(inputString: String) -> String {
        var q = inputString
        
        if inputString.contains("=") {
            var a = [String]()
            a = q.components(separatedBy: "=")
            q = a[1]
        }
        return q
//        let validateEqual = validate(inputString: inputString)
//        return validateEqual
    }

//    func validate(inputString: String) -> String {
//        var a = ""
//        if inputString.contains("=") {
//            a = inputString.components(separatedBy: "=")[1]
//        }
//        return a
//    }
}
