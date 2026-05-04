//
//  ActivityScrenView.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 28/04/2026.
//

import SwiftUI
import SwiftData

struct ActivityScreenView: View {
	@Environment(\.modelContext) private var modelContext
	@StateObject var controller = TeachersCornerController()
	@Query(sort: \Challenges.name, order: .forward) var challenges: [Challenges]
	
	var body: some View {
		Header(title: "Physical Challenges", backgroundColor: .secondaryButton)
		VStack {
			HStack {
				Text("Challenges")
					.font(.system(size: 36, weight: .semibold, design: .none))
					.padding(.top)
				if challenges.isEmpty == false {
						NavigationLink(destination: AddChallengeView(controller: controller)) {
								Image(systemName: "plus")
						}.buttonStyle(PlainButtonStyle())
				}
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
						.swipeActions(edge: .trailing, allowsFullSwipe: true) {
								Button(role: .destructive) {
										modelContext.delete(challenge) // Now this will work!
								} label: {
										Label("Delete", systemImage: "trash")
								}
						}
						.swipeActions(edge: .leading) {
								NavigationLink(destination: EditChallengeView(controller: controller, challenge: challenge)) {
										Label("Edit", systemImage: "pencil")
								}
								.tint(.blue)
						}
					}
			}
			.listStyle(.plain)
				
			} else {
				
				NavigationLink(destination: AddChallengeView(controller: controller)){
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
