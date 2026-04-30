//
//  GameScreen.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 27/04/2026.
//

import SwiftUI

struct GameScreenView: View {
    var userMoney: Int = 0
    var userPet: Image = Image("PetImage") //This gets replaced by the images in PetAccesories
    var body: some View {
        VStack{
        
        
            ZStack {   Image("GameBG")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: 410)
                    .frame(height: 400)
                    .clipped()
                Pet(userPet: userPet)
                    .frame(height: 300)
                VStack{
                HStack{
                    Wallet(money: userMoney)
                    Spacer()
                    Button() {
                        
                    } label: {
                        Image("ClosetImage")
                            .resizable()
                            .scaledToFit()
                    }.buttonStyle(ClosetButtonStyle())
                }
                .frame(maxWidth: .infinity, maxHeight: 80)
                .padding()
                    Spacer()
                    HStack{
                        Button(){} label: {
                            Image(systemName: "house.fill")
                                .foregroundStyle(Color.white)
                                .shadow(color: .secondaryTitle.opacity(0.8), radius: 10, x: 0, y:10)
                                .font(.system(size: 72))
                           
                        }
                        Spacer()
                        Button(){} label: {
                            Image(systemName: "cart.fill")
                                .foregroundStyle(Color.white)
                                .shadow(color: .secondaryTitle.opacity(0.8), radius: 10, x: 0, y:10)
                                .font(.system(size: 72))
                        }
                    }.frame(maxWidth: .infinity, maxHeight: 100)
                        .padding()
            }
            
        }
        VStack(spacing: 12) {
            Button("Jump"){}
                .buttonStyle(ChallengeButton(coinsGain: 100))
            Button("Jump"){}
                .buttonStyle(ChallengeButton(coinsGain: 100))
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
