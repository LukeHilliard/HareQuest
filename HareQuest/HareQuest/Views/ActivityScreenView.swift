//
//  ActivityScrenView.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 28/04/2026.
//

import SwiftUI
import SwiftData

struct ActivityScreenView: View {
	@StateObject var controller = TeachersCornerController()
	@Query(sort: \Challenges.name, order: .forward) var challenges: [Challenges]
	
	var body: some View {
		Header(title: "Physical Challenges", backgroundColor: .secondaryButton)
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
			
			if challenges.isEmpty == false {
				List {
					ForEach(challenges) { challenge in
							Button(challenge.name) {}
							.buttonStyle(ChallengeButton(coinsGain: challenge.reward))
						
							.listRowSeparator(.hidden)
							.listRowBackground(Color.clear)
					}
			}
			.listStyle(.plain)
				
//				VStack{
//					Button("Jump"){}.buttonStyle(ChallengeButton( coinsGain: 4))
//					Button("Play a football match with your friends"){}.buttonStyle(ChallengeButton( coinsGain: 100))
//					Button("Do 10 Jumping Jacks"){}.buttonStyle(ChallengeButton( coinsGain: 10))
//					Button("Jump"){}.buttonStyle(ChallengeButton( coinsGain: 4))
//				}
			} else {
				
				NavigationLink(destination: AddChallengeView()){
					Text("Add Challenge")
					
				}.buttonStyle(CreateButtonStyle())
				
			}
		}.navigationBarBackButtonHidden(true)
		Spacer()
	}
}
                
													

#Preview {
	ActivityScreenView(controller: TeachersCornerController())
}
