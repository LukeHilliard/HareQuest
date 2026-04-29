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
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(.darkText)
                    .multilineTextAlignment(.leading)
                .minimumScaleFactor(0.7)
   Spacer()
            Image("CoinImage")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .padding(.leading, 5)
            
            HStack {
                Text(String(coinsGain))
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
            }.frame(width: 50)
            
               
            
               
                
           
            
        }
            .shadow(color: .black.opacity(1), radius: 100, x: 0, y: 20)
            .font(.system(.title3, design: .rounded, weight: .bold))
            .padding(.horizontal, 40)
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(color)
                    .shadow(color: .black.opacity(0.22), radius: 8, x: 4, y: 6)
            }
            
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
    }
    

}
