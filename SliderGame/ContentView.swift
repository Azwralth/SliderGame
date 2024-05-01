//
//  ContentView.swift
//  SliderGame
//
//  Created by Владислав Соколов on 01.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = 10
    @State private var currentValue = 80.0
    @State private var isPresented = false
    
    var body: some View {
        VStack {
            SliderView(
                currentValue: $currentValue,
                targetValue: targetValue,
                color: .red,
                alpha: computeScore()
            )
            
            ButtonView(text: "Проверь меня!") {
                isPresented = true
            }
            .alert("You score", isPresented: $isPresented, actions: {}) {
                Text("\(computeScore())")
            }
            
            ButtonView(text: "Начать заново", action: setRandomNumber)
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
    private func setRandomNumber() {
        targetValue = Int.random(in: 0...100)
        currentValue = Double.random(in: 0...100)
    }
}

#Preview {
    ContentView()
}
