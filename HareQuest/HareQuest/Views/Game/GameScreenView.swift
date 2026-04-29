//
//  GameScreen.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 27/04/2026.
//

import SwiftUI

struct GameScreenView: View {
    var userMoney: Int = 0
    var userPet: Image = Image("PetImage")
    var body: some View {
        VStack{
        VStack {
            Button("Hareobics with Harper"){}
                .buttonStyle(HeaderStyle(color: .secondaryButton))
              
            
        }.ignoresSafeArea(.all)
        
        
        ZStack {   Image("GameBG")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: 400)
                .clipped()
            Pet(userPet: userPet)
                .frame(height: 300)
            HStack{
                Wallet(money: userMoney)
                
            }.padding()
            
        }
        VStack(spacing: 12) {
            Button("Jump"){}
                .buttonStyle(ChallengeButton(coinsGain: 100))
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.top, 26)

        
        }.background(Color.secondaryButton)
}
}

#Preview {
    GameScreenView()
}
