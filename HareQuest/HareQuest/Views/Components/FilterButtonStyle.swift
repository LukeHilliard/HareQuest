//
//  FilterButtonStyle.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 28/04/2026.
//

import SwiftUI

struct FilterButtonStyle: ButtonStyle {
    var status: Color = .blue
    func makeBody(configuration: Configuration) -> some View {
        
        HStack{
          
            configuration.label
                .font(.system(size: 18, weight: .regular, design: .rounded))
                .foregroundColor(status)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.7)

            
               
                
           
            
        }
            .shadow(color: .black.opacity(1), radius: 100, x: 0, y: 20)
            .font(.system(.title3, design: .rounded, weight: .bold))
        
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 50)
                    .fill(status.opacity(0.2))
                    .shadow(color: .black.opacity(0.22), radius: 8, x: 4, y: 6)
                    .overlay {
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(status, lineWidth: 2)
                    }
                   
            }
            .padding(.horizontal,5)
            
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
    }
    

}
