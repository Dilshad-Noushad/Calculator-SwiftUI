//
//  Color+.swift
//  MyCalculator
//
//  Created by Dilshad N on 15/05/22.
//

import SwiftUI

extension Color {
    
    static var backgroundColor: Color {
        return Color(#colorLiteral(red: 69/255, green: 71/255, blue: 96/255, alpha: 1))
    }
    
    static var buttonColor1: Color {
        Color(UIColor { $0.userInterfaceStyle == .dark ? UIColor(#colorLiteral(red: 178/255, green: 185/255, blue: 246/255, alpha: 1)) : UIColor(#colorLiteral(red: 178/255, green: 185/255, blue: 246/255, alpha: 1)) })
    }
    
    static var color80C084: Color {
        Color(UIColor { $0.userInterfaceStyle == .dark ? UIColor(#colorLiteral(red: 128/255, green: 198/255, blue: 132/255, alpha: 1)) : UIColor(#colorLiteral(red: 128/255, green: 198/255, blue: 132/255, alpha: 1)) })
    }
    
    static var colorf2f3f8: Color {
        Color(UIColor { $0.userInterfaceStyle == .dark ? UIColor(#colorLiteral(red: 242/255, green: 243/255, blue: 248/255, alpha: 1)) : UIColor(#colorLiteral(red: 242/255, green: 243/255, blue: 248/255, alpha: 1)) })
    }
    
}
