//
//  CalculatorService.swift
//  adaptCalculator
//
//  Created by OnlyFrenzy on 12.10.2020.
//

import Foundation


class CalculatorService {
    
    func calculate(inputString: String) -> Double? {
        let postfixStrings = reversTermToPostfix(inputString: inputString)
        return calculateEndValue(postfixStrings: postfixStrings)
    }
    
    private func reversTermToPostfix(inputString: String) -> [String] {
        
        var calculatorStack = Stack()
        var resultStrings = [String]()
        var buferString = ""
        
        for char in inputString {
            
            if char == "(" {
                calculatorStack.push(String(char))
            }
            if char == ")" {
                if !buferString.isEmpty{
                    resultStrings.append(buferString)
                    buferString = ""
                }
//                resultStrings.append(buferString)
                while calculatorStack.topItem != "(" {
                    resultStrings.append(calculatorStack.pop())
                }
                _ = calculatorStack.pop()
            }
            if let sign = Sign(rawValue: String(char)) {
                
                if !buferString.isEmpty{
                    resultStrings.append(buferString)
                    buferString = ""
                }
                
                while calculatorStack.isNeedToPopTopElement(sign: sign) {
                    resultStrings.append(calculatorStack.pop())
                }
                
                calculatorStack.push(sign.rawValue)
            } else if char.isNumber || char == "." {
                buferString += String(char)
            }
        }
        
        if !buferString.isEmpty {
            resultStrings.append(buferString)
        }
        
        
        resultStrings += calculatorStack.popAllValues()
        return resultStrings
    }
    
    private func calculateEndValue(postfixStrings: [String]) -> Double? {
        
        var doubleArray = [Double]()
        postfixStrings.forEach { (value) in
            
            if let sign = Sign(rawValue: value) {
                
                if sign == .squareRoot {
                    guard let lhs = doubleArray.popLast() else { return }
                    
                    let result = sign.calculate(lhs: lhs)
                    doubleArray.append(result)
                } else {
                    guard let rhs = doubleArray.popLast(),
                          let lhs = doubleArray.popLast() else { return }
                    
                    let result = sign.calculate(lhs: lhs, rhs: rhs)
                    doubleArray.append(result)
                }
            } else {
                guard let doubleValue = Double(value) else { return }
                
                doubleArray.append(doubleValue)
            }
        }
        return doubleArray.last
    }
}
