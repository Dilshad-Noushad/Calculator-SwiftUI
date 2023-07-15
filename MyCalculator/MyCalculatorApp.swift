//
//  MyCalculatorApp.swift
//  MyCalculator
//
//  Created by Dilshad N on 09/05/22.
//

import SwiftUI

@main
struct MyCalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(GlobalEnvironment())
        }
    }
}
