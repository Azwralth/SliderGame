//
//  ButtonView.swift
//  SliderGame
//
//  Created by Владислав Соколов on 01.05.2024.
//

import SwiftUI

struct ButtonView: View {
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(text) {
            action()
        }
        .frame(width: 150, height: 60)
        .font(.custom("", size: 20))
        .padding(.bottom, -20)
    }
}

#Preview {
    ButtonView(text: "Проверь меня", action: {})
}
