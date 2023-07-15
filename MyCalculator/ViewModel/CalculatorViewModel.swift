//
//  ViewModel.swift
//  MyCalculator
//
//  Created by Dilshad N on 09/05/22.
//

import Foundation

class GlobalEnvironment: ObservableObject {
    
    @Published var display = "0"
    
    private var isFinishedTypingNumber: Bool = true
    private var lastInput: CalculatorButtons?
    private var calculator = Logic()
    
    private var displayValue: Double {
        get {
            guard let number = Double(self.display) else { fatalError("Cannot convert display label text to a Double") }
            return number
        }
        set {
            self.display = newValue.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", newValue) : String(newValue)
        }
    }
    
    private func isLastInputOperator() -> Bool {
        guard let lastInput = lastInput else { return false }
        return lastInput == .divide || lastInput == .multiply || lastInput == .add || lastInput == .subtract
    }
    
    
    
    func didTap(btnValue: CalculatorButtons) {
        switch btnValue {
        case .add, .subtract, .multiply, .divide, .equals, .clear, .plusOrMinus, .percent:
            // check for two consecutive operators
            if isLastInputOperator() { break }
            
            isFinishedTypingNumber = true
            
            calculator.setNumber(displayValue)
            
            if let result = calculator.calculate(symbol: btnValue) {
                displayValue = result
            }
            
        default:
            if isFinishedTypingNumber {
                
                // do not duplicate zeros
                if displayValue == 0 && btnValue == .zero {
                    return
                }
                
                if btnValue == .decimal {
                    self.display = "0" + btnValue.title
                } else { self.display = btnValue.title }
                
                isFinishedTypingNumber = false
                
            } else {
                
                if btnValue == .decimal {
                    
                    // check if number is whole number
                    if self.display.contains(".") { return }
                    
                    // check if number already has a decimal
                    let isInt = floor(displayValue) == displayValue
                    if !isInt { return }
                }
                self.display = self.display + btnValue.title  // dealing the concat of nos
            }
        }
        lastInput = btnValue
    }
}
