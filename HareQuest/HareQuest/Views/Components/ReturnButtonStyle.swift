//
//  ReturnButtonStyle.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 28/04/2026.
//


import SwiftUI

struct ReturnButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let color = Color.red

        return HStack {
            
            configuration.label
            
        }
        
        .font(.system(.title3, design: .rounded, weight: .bold))
        .foregroundColor(.white)
       
        .padding()
 
        .background {
            RoundedRectangle(cornerRadius: 50)
                .foregroundColor(color.opacity(0.8))
                .shadow(color: .red.opacity(0.2), radius: 10, x: 0, y:10)
        }
        
        .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
    }
}
