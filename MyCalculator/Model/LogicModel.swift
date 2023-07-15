//
//  Logic.swift
//  MyCalculator
//
//  Created by Dilshad N on 09/05/22.
//

import SwiftUI

struct Logic {
    
    private var number: Double?
    private var previousValue: Double?
    private var currentNumber: Double?
    private var operation: CalculatorButtons?
    private var calculatedValue: Double = 0
    private var lastInputEqual = false
    
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    private mutating func resetCalculator() -> Double {
        previousValue = nil
        currentNumber = nil
        operation = nil
        return 0
    }
    
    
    
    mutating func calculate(symbol: CalculatorButtons) -> Double? {
        
        if let number = number {
            switch symbol {
            case .plusOrMinus:
                if number != 0 { return number * -1 }
            case .clear:
                return resetCalculator()
            case .percent:
                return number * 0.01
            case .equals:
                
                lastInputEqual = true
                
                if let previousValue = previousValue {
                    if let currentNumber = currentNumber {
                        return performCalculation(previousValue: previousValue, currentNumber: currentNumber)
                    } else {
                        currentNumber = number
                        return performCalculation(previousValue: previousValue, currentNumber: number)
                    }
                }
                
            default:
                if lastInputEqual {
                    lastInputEqual = false
                    previousValue = nil
                }
                
                if let previousValue = previousValue {
                    let result = performCalculation(previousValue: previousValue, currentNumber: number)
                    operation = symbol
                    return result
                }
                
                operation = symbol
                currentNumber = nil
                previousValue = previousValue != nil ? previousValue : number
            }
        }
        return nil
    }
    
    private mutating func performCalculation(previousValue: Double, currentNumber: Double) -> Double? {
        
        if let operation = operation {
            switch operation {
            case .add:
                calculatedValue = previousValue + currentNumber
            case .subtract:
                calculatedValue = previousValue - currentNumber
            case .multiply:
                calculatedValue = previousValue * currentNumber
            case .divide:
                calculatedValue = previousValue / currentNumber
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        self.previousValue = calculatedValue
        return calculatedValue
    }
    
}


