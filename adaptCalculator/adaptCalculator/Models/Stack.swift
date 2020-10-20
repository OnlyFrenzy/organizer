//
//  Stack.swift
//  adaptCalculator
//
//  Created by OnlyFrenzy on 12.10.2020.
//

import Foundation


struct Stack {
    
    private var items = [String]()
    
    var topItem: String? {
        return items.last
    }
    
    mutating func push(_ item: String) {
        items.append(item)
    }
    
    mutating func pop() -> String {
        return items.removeLast()
    }
    
    func isNeedToPopTopElement(sign: Sign) -> Bool {
        guard let topItem = topItem, let topSign = Sign(rawValue: topItem) else { return false }
        
        return isHighPriority(first: topSign, second: sign)
    }
    
    private func isHighPriority(first: Sign, second: Sign) -> Bool {
        return first.priority() >= second.priority()
    }
    
    mutating func popAllValues() -> [String] {
        var resultStrings = [String]()
        
        while topItem != nil {
            resultStrings.append(pop())
        }
        return resultStrings
    }
}
