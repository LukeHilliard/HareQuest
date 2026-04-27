//
//  TeacherHomeScreenView.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 27/04/2026.
//

import SwiftUI

struct TeacherHomeScreenView: View {
    var body: some View {
        VStack {
            ZStack {
                
                Image("HomeTBGImage")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0)
                    .edgesIgnoringSafeArea(.all)
                HStack {
                    
                    
                    VStack(alignment: .leading) {
                        Spacer()
                        Text("Good morning")
                        Text("Ms. Harrison!") // TODO Put actual name of teacher
                        
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
               
                Button("Treasure Hunt"){}
                    .buttonStyle(ActivityButtonStyle(color: .mainButton)).padding(.top)
                
                Button("Burrow Adventures"){}
                    .buttonStyle(ActivityButtonStyle(color: .tertiaryButton)).padding(.top)
                Button("Physical Callenges"){}
                    .buttonStyle(ActivityButtonStyle(color: .secondaryButton)).padding(.top)
            }.padding(.horizontal)
                .padding(.vertical, 70)
        }
    
    }
}

#Preview {
    TeacherHomeScreenView()
}
