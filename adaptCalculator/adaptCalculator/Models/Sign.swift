//
//  Sign.swift
//  adaptCalculator
//
//  Created by OnlyFrenzy on 12.10.2020.
//

import Foundation


enum Sign: String {
    
    case minus = "-"
    case plus = "+"
    case multiply = "✕"
    case division = "÷"
    case squareRoot = "√"
    
    func binary() -> [Sign] {
        return [.division, .minus, .multiply, .plus]
    }
    
    func prefix() -> [Sign] {
        return [.squareRoot]
    }
    
    func priority() -> Int {
        
        switch self {
        case .division:
            return 1
        case .multiply:
            return 1
        case .squareRoot:
            return 2
        case .minus:
            return 0
        case .plus:
            return 0
        }
    }
    
    func calculate(lhs: Double, rhs: Double? = nil) -> Double {
        switch self {
        case .division:
            guard let rhs = rhs else { return lhs }
            return lhs / rhs
        case .multiply:
            guard let rhs = rhs else { return lhs }
            return lhs * rhs
        case .squareRoot:
            return sqrt(lhs)
        case .minus:
            guard let rhs = rhs else { return lhs }
            return lhs - rhs
        case .plus:
            guard let rhs = rhs else { return lhs }
            return lhs + rhs
        }
    }
}
