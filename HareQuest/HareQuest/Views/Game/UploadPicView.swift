//
//  UploadPicView.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 29/04/2026.
//

import SwiftUI

struct UploadPicView: View {
    var body: some View {
        ZStack{
            Image("GameBG")
                    .resizable()
                    .scaledToFill()
                    .overlay {
                        Color.black.opacity(0.2)
                            .clipShape(RoundedRectangle(cornerRadius: 42))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .clipped()
                    .ignoresSafeArea()
            
            VStack(alignment: .center){
                Button("Jump"){} // This has to be the actual challenge clicked
                    .buttonStyle(ChallengeButton(coinsGain: 100))
                
                Button("Start Recording"){
                    
                }.buttonStyle(ProofButtonStyle(imageName: "ClassroomImage", systemIcon: Image(systemName: "video.fill") )).padding(.top)
                
                Button("Upload your image"){
                    
                }.buttonStyle(ProofButtonStyle(imageName: "KidsExcersisingImage", systemIcon: Image(systemName: "square.and.arrow.up")))
                
            }
            .padding()
                .padding(.horizontal)
                .frame(maxWidth: 420)
            
        }
    }
  
}

#Preview {
    UploadPicView()
}

