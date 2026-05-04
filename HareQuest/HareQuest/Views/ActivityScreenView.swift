//
//  ActivityScrenView.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 28/04/2026.
//

import SwiftUI


struct ActivityScreenView: View {
    
    var body: some View {
        VStack {
            Button("Physical Challenges"){}
                .buttonStyle(HeaderStyle(color: .secondaryButton))
            VStack {
                HStack {
                    Text("Challenges")
                        .font(.system(size: 36, weight: .semibold, design: .none))
                        .padding(.top)
                    
                    
                }
                
                
                /// Horizontal line
                Capsule()
                    .fill(Color.black.opacity(0.8))
                    .frame(height: 1)
                    .padding(.horizontal)
                Button("Add Challenge"){
                    
                }.buttonStyle(CreateButtonStyle())
                    .padding(.top)
                //for each loop
                VStack{
										Button("Jump"){}.buttonStyle(ChallengeButton( coinsGain: 4))
                    Button("Play a football match with your friends"){}.buttonStyle(ChallengeButton( coinsGain: 100))
                    Button("Do 10 Jumping Jacks"){}.buttonStyle(ChallengeButton( coinsGain: 10))
                    Button("Jump"){}.buttonStyle(ChallengeButton( coinsGain: 4))
                }.padding()
                
           
                Spacer()
                
                
            }
				}.navigationBarBackButtonHidden(true)
				.ignoresSafeArea(.all)

		}
    
}

#Preview {
    ActivityScreenView()
}
