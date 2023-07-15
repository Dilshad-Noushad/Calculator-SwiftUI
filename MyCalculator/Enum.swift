//
//  Enum.swift
//  MyCalculator
//
//  Created by Dilshad N on 16/05/22.
//

import SwiftUI


enum CalculatorButtons: String {
    
    case zero
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case add
    case subtract
    case multiply
    case divide
    case clear
    case plusOrMinus
    case equals
    case decimal
    case percent
    
    
    var title: String{
        switch self {
        case .zero:
            return "0"
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        case .add:
            return "+"
        case .subtract:
            return "-"
        case .multiply:
            return "X"
        case .divide:
            return "÷"   // "option + /"
        case .plusOrMinus:
            return "±"
        case .equals:
            return "="
        case .decimal:
            return "."
        case .percent:
            return "%"
        default:
            return "AC"
        }
    }
    var btnColor: Color {
        
        switch self {
        case .subtract, .add, .multiply, .divide, .equals:
            return .orange
        case .percent, .plusOrMinus, .clear:
            return Color(.lightGray)
        default:
            return Color.buttonColor1
            //Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
            
        }
    }
    
    var textColor: Color {
        switch self {
        case .clear, .plusOrMinus, .percent:
            return Color(.black)
        default:
            return Color.colorf2f3f8
        }
    }
}
