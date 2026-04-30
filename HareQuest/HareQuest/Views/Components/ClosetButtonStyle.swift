//
//  ClosetButtonStyle.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 29/04/2026.
//

import SwiftUI

struct ClosetButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
       

        return HStack {
            
            configuration.label
               
                .scaledToFit()
            
        }
        .font(.system(.title3, design: .rounded, weight: .bold))
        .foregroundColor(.white)
       
        .padding(.horizontal)
        .padding(.vertical)
        .background {
            Circle()
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y:10)
        }
        
        .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
    }
}
