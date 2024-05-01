//
//  SliderViewRepresentation.swift
//  SliderGame
//
//  Created by Владислав Соколов on 01.05.2024.
//

import SwiftUI

struct SliderViewRepresentation: UIViewRepresentable {
    @Binding var currentValue: Double
    let alpha: Int
    let color: UIColor
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didChangeValueSlider),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alpha) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $currentValue)
    }
}

extension SliderViewRepresentation {
    final class Coordinator: NSObject {
        @Binding var currentValue: Double
        
        init(value: Binding<Double>) {
            self._currentValue = value
        }
        
        @objc func didChangeValueSlider(_ sender: UISlider) {
            currentValue = Double(sender.value)
        }
    }
}
