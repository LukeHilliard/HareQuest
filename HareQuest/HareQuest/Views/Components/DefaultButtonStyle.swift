//
//  DefaultButtonStyle.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 16/04/2026.
//

import SwiftUI

struct DefaultButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let color = configuration.role == .destructive ? Color.red : Color.mainButton

        return HStack {
            
            configuration.label
            
        }
        .font(.system(.title3, design: .rounded, weight: .bold))
        .foregroundColor(.white)
        .padding(.horizontal, 100)
        .padding(.vertical)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(color)
        }
        .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
    }
}
