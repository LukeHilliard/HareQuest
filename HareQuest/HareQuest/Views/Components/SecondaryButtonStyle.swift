//
//  SecondaryButtonStyle.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 21/04/2026.
//

import SwiftUI

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let color = configuration.role == .destructive ? Color.red : Color.secondaryButton

        return HStack {
            
            configuration.label
            
        }
        .shadow(color: .black.opacity(1), radius: 100, x: 0, y:20)
        .font(.system(.title3, design: .rounded, weight: .bold))
        .foregroundColor(.white)
       
        .padding(.horizontal, 100)
        .padding(.vertical)
        .background {
            RoundedRectangle(cornerRadius: 50)
                .foregroundColor(color)
        }
        
        .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
    }
}
