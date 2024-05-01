//
//  SliderView.swift
//  SliderGame
//
//  Created by Владислав Соколов on 01.05.2024.
//

import SwiftUI

struct SliderView: View {
    @Binding var currentValue: Double
    
    var targetValue: Int
    var color: UIColor
    var alpha: Int
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к \(targetValue)")
                .padding(.bottom, 30)
            HStack {
                Text("0")
                SliderViewRepresentation(currentValue: $currentValue, alpha: alpha, color: color)
                Text("100")
            }
        }
    }
}

#Preview {
    SliderView(
        currentValue: .constant(50),
        targetValue: 100,
        color: .red,
        alpha: 100
    )
}

