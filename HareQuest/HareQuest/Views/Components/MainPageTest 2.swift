//
//  MainPageTest.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 27/04/2026.
//

import SwiftUI

struct MainPageTest: View {
    
    var studentName: String = "Maya"
    var body: some View {
        VStack {
            ZStack {
                
                Image("HomeBGImage")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0) // 👈 This will keep other views (like a large text) in the frame
                    .edgesIgnoringSafeArea(.all)
                HStack {
                    
                    
                    VStack(alignment: .leading) {
                        Spacer()
                        Text("Good morning")
                        Text("\(studentName)!")
                        
                    } .multilineTextAlignment(.leading)
                    .font(.system(size: 36, weight: .heavy, design: .rounded))
                        
                        .foregroundColor(.black.opacity(0.85))
                    Spacer()
                    
                    
                }
                .padding(.vertical, 38)
                .padding(.horizontal, 38)
                .frame(maxWidth: .infinity)
                
            }.frame(height: 0)
                .frame(minWidth: 0 ) // 👈 This will keep other views (like a large text) in the frame
                .edgesIgnoringSafeArea(.all).padding(.vertical)
        
    
            VStack {
               
                Button("Harper's Treasure Hunt"){}
                    .buttonStyle(GameButtonStyle(color: .mainButton, gameIcon: Image("HuntImage"))).padding(.vertical)
                
                Button("Burrow Adventures"){}
                    .buttonStyle(GameButtonStyle(color: .tertiaryButton, gameIcon: Image("HuntImage")))
                Button("Hareobics with Harper"){}
                    .buttonStyle(GameButtonStyle(color: .secondaryButton, gameIcon: Image("HareobicsImage")))
            }.padding(.horizontal)
                .padding(.vertical, 70)
        }
    
    }
}

#Preview {
    MainPageTest()
}
