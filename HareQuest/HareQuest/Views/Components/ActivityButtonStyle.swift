//
//  ActivityButtonStyle.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 27/04/2026.
//

import SwiftUI

struct ActivityButtonStyle: ButtonStyle {
    var color: Color = .blue
   

    func makeBody(configuration: Configuration) -> some View {
        HStack{
          
            configuration.label
                .font(.system(size: 28, weight: .heavy, design: .rounded))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.7)

   
               
                
           
            
        }
            .shadow(color: .black.opacity(1), radius: 100, x: 0, y: 20)
            .font(.system(.title3, design: .rounded, weight: .bold))
            .foregroundColor(.white)
            .padding(.horizontal, 40)
            .padding(.vertical, 50)
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 50)
                    .foregroundColor(color)
                    .shadow(color: .black.opacity(0.22), radius: 8, x: 4, y: 6)
            }
            
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
    }
    

}
