//
//  GameButtonStyle.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 25/04/2026.
//

import SwiftUI

struct GameButtonStyle: ButtonStyle {
    var color: Color = .blue
    var imageName: String = "DefaultImage"

    func makeBody(configuration: Configuration) -> some View {
        HStack{
          
            configuration.label
                .font(.system(size: 24, weight: .heavy, design: .rounded))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.7)
       
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 130)
           
            
        }
            .shadow(color: .black.opacity(1), radius: 100, x: 0, y: 20)
            .font(.system(.title3, design: .rounded, weight: .bold))
            .foregroundColor(.white)
            .padding(.horizontal, 40)
            .padding(.vertical, 15)
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 50)
                    .foregroundColor(color)
                    .shadow(color: .black.opacity(0.22), radius: 8, x: 4, y: 6)
            }
            
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
    }
    

}
