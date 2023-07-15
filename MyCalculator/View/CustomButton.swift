//
//  CustomButton.swift
//  MyCalculator
//
//  Created by Dilshad N on 10/05/22.
//

import SwiftUI


struct CustomButton: View {
    
    var title: String = "0"
    var btn : CalculatorButtons
    
    var body: some View {
        
        Text(title)
            .foregroundColor(btn.textColor)
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .frame(width: self.buttonWidth(button: btn), height: buttonHeight())
            .background(
                ZStack {
                    btn.btnColor
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .foregroundColor(.white)
                        .blur(radius: 4)
                        .offset(x: -8, y: -8)
                    
                    
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(btn.btnColor)
                        .padding(2)
                        .blur(radius: 2)
                    
                }
            )
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
    /// Button width
    func buttonWidth(button: CalculatorButtons) -> CGFloat {
        if button == .zero {
            return ((UIScreen.main.bounds.width - (4 * 15)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5 * 15)) / 4
    }
    /// Button height
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5 * 15)) / 4
    }
    
    
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            CustomButton(title: "0", btn: CalculatorButtons.plusOrMinus).preferredColorScheme($0)
        }
        
    }
}
