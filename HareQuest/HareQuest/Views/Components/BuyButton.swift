//
//  BuyButton.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 25/04/2026.
//


import SwiftUI

struct BuyButton: ButtonStyle {
    var coinsGain: Int = 0
    func makeBody(configuration: Configuration) -> some View {
        
        HStack{
          
            configuration.label
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundColor(.secondaryButton)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.7)

            
               
                
           
            
        }
            .shadow(color: .black.opacity(1), radius: 100, x: 0, y: 20)
            .font(.system(.title3, design: .rounded, weight: .bold))
            .padding(.horizontal, 40)
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .shadow(color: .black.opacity(0.22), radius: 8, x: 4, y: 6)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.secondaryButton, lineWidth: 5)
                    }
                   
            }
            .padding()
            
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
    }
    

}
