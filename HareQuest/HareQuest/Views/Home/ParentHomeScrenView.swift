//
//  ParentHomeScrenView.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 27/04/2026.
//

import SwiftUI

struct ParentHomeScreenView: View {
    var body: some View {
        VStack {
            ZStack {
                
                Image("HomeBGImage")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0)
                    .edgesIgnoringSafeArea(.all)
                HStack {
                    
                    
                    VStack(alignment: .leading) {
                        Spacer()
                        Text("Good morning")
                        Text("Maya!") // TODO Put actual name of student
                        
                    } .multilineTextAlignment(.leading)
                    .font(.system(size: 36, weight: .heavy, design: .rounded))
                        
                        .foregroundColor(.black.opacity(0.85))
                    Spacer()
                    
                    
                }
                .padding(.vertical, 38)
                .padding(.horizontal, 38)
                .frame(maxWidth: .infinity)
                
            }.frame(height: 0)
                .frame(minWidth: 0 )
                .edgesIgnoringSafeArea(.all).padding(.vertical)
        
    
            VStack {
               
                Button("Harper's Treasure Hunt"){}
                    .buttonStyle(GameButtonStyle(color: .mainButton, gameIcon: Image("HuntImage"))).padding(.top)
                
                Button("Burrow Adventures"){}
                    .buttonStyle(GameButtonStyle(color: .tertiaryButton, gameIcon: Image("AdventureImage"))).padding(.top)
                Button("Hareobics with Harper"){}
                    .buttonStyle(GameButtonStyle(color: .secondaryButton, gameIcon: Image("HareobicsImage"))).padding(.top)
            }.padding(.horizontal)
                .padding(.vertical, 70)
        }
    
    }
}

#Preview {
    ParentHomeScreenView()
}
