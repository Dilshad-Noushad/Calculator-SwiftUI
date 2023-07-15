//
//  ContentView.swift
//  MyCalculator
//
//  Created by Dilshad N on 09/05/22.
//

import SwiftUI

struct ContentView: View {
    
    let buttons: [[CalculatorButtons]] = [
        [.clear, .plusOrMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equals]
    ]
    @EnvironmentObject var env: GlobalEnvironment
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black
            Color.backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            
            VStack(spacing: 10) {
                // Text to Result
                HStack {
                    Spacer()
                    Text(env.display)
                        .bold()
                        .foregroundColor(.black.opacity(0.7))
                        .font(.system(size: 65))
                        .foregroundColor(.white)
                        .minimumScaleFactor(0.5)
                        .lineLimit(4)
                        .padding([.bottom, .trailing], 5)
                }
                .frame(maxWidth: .infinity, maxHeight: 300, alignment: .bottomTrailing)
                .background(Color.color80C084.opacity(0.7))
                .cornerRadius(10)
                .shadow(color: .white, radius: 2)
                .padding()
                
                
                // Buttons
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { btn in
                            
                            ButtonView(btn: btn)
                            
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
    }
}

struct ButtonView: View {
    
    var btn: CalculatorButtons
    @EnvironmentObject var env: GlobalEnvironment
    
    var body: some View {
        
        Button ( action: {
            self.env.didTap(btnValue: btn)
            print(btn)
        }, label: {
            CustomButton(title: btn.title, btn: btn)
            
        })
    }
}








/// Rounded Button
//struct ButtonView: View {
//
//    var btn: CalculatorButtons
//    @EnvironmentObject var env: GlobalEnvironment
//
//    var body: some View {
//
//        Button ( action: {
//            self.env.didTap(btnValue: btn)
//            print(btn)
//        }, label: {
////            Text(btn.rawValue)
//            Text(btn.title)
//                .font(.system(size: 32))
//                .frame(width: self.buttonWidth(button: btn), height: buttonHeight())
//                .background(btn.btnColor)
//                .foregroundColor(btn.textColor)
//                .cornerRadius(self.buttonWidth(button: btn))
//        })
//    }
//
//    func buttonWidth(button: CalculatorButtons) -> CGFloat {
//
//        if button == .zero {
//            return ((UIScreen.main.bounds.width - (4 * 15)) / 4) * 2
//        }
//        return (UIScreen.main.bounds.width - (5 * 15)) / 4
//    }
//
//    func buttonHeight() -> CGFloat {
//            return (UIScreen.main.bounds.width - (5 * 15)) / 4
//        }
//}


extension Double {
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            ContentView().preferredColorScheme($0)
                .environmentObject(GlobalEnvironment())
        }
        
    }
}
