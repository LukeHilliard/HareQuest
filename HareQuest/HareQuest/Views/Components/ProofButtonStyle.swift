//
//  ProofButtonStyle.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 29/04/2026.
//

import SwiftUI

struct ProofButtonStyle: ButtonStyle {
    var imageName: String = ""
    var systemIcon: Image = Image(systemName: "camera.viewfinder")
    
    func makeBody(configuration: Configuration) -> some View {
        VStack() {
            configuration.label
                .font(.system(size: 32, weight: .heavy, design: .rounded))
                        .foregroundStyle(.secondaryTitle)

            ZStack {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(maxHeight: 210)
                    .clipShape(RoundedRectangle(cornerRadius: 42))
                    .overlay {
                        Color.black.opacity(0.6)
                            .clipShape(RoundedRectangle(cornerRadius: 42))
                    }
                    .padding(.horizontal)

                    systemIcon
                        .font(.system(size: 100, weight: .bold))
                        .foregroundStyle(.white)
                
            }.padding(.bottom)

                }
             
                .padding(.vertical)
        
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.shop)
                        .shadow(color: .black.opacity(0.35), radius: 6, x: 5, y: 5)
                )
                
              
    }
}
