//
//  ChallengeButton.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 25/04/2026.
//

import SwiftUI

struct ChallengeButton: ButtonStyle {

    var color: Color = .challengeButton
    var coinsGain: Int = 0
    func makeBody(configuration: Configuration) -> some View {
        
        HStack{
          
            configuration.label
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .foregroundColor(.darkText)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.7)
   Spacer()
            Image("CoinImage")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            
            Text(String(coinsGain))
            
               
                
           
            
        }
            .shadow(color: .black.opacity(1), radius: 100, x: 0, y: 20)
            .font(.system(.title3, design: .rounded, weight: .bold))
            .padding(.horizontal, 40)
            .padding(.vertical, 15)
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(color)
                    .shadow(color: .black.opacity(0.22), radius: 8, x: 4, y: 6)
            }
            
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
    }
    

}
