//
//  ColorUISlider.swift
//  RGBullsEye
//
//  Created by Ryan Spishock on 6/16/20.
//  Copyright © 2020 Ryan Spishock. All rights reserved.
//

import SwiftUI

// Creates a slider view
struct ColorUISlider: UIViewRepresentable {
    
    class Coordinator: NSObject {
        // 1
        var value: Binding<Double>
        // 2
        init(value: Binding<Double>) {
            self.value = value
        }
        // 3
        @objc func valueChanged(_ sender: UISlider) {
            self.value.wrappedValue = Double(sender.value)
        }
    }
    
    var color: UIColor
    @Binding var value: Double
    
    func makeCoordinator() -> ColorUISlider.Coordinator {
        Coordinator(value: $value)
    }
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.thumbTintColor = color
        slider.value = Float(value)
        slider.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged(_:)), for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(self.value)
    }
}

struct ColorUISliderPreviews: PreviewProvider {
    static var previews: some View {
        ColorUISlider(color: .red, value: .constant(0.5))
    }
}
