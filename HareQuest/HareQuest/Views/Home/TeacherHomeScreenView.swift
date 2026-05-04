//
//  TeacherHomeScreenView.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 27/04/2026.
//

import SwiftUI

struct TeacherHomeScreenView: View {

		@StateObject var controller = TeachersCornerController()
		
		var body: some View {

						VStack(spacing: 0) {
								ZStack(alignment: .leading) {
										Image("HomeTBGImage")
												.resizable()
												.scaledToFill()
												.frame(height: 220)
												.clipped()
												.ignoresSafeArea(edges: .top)
										
										VStack(alignment: .leading, spacing: 4) {
												Text("Good morning,")
														.font(.system(size: 24, weight: .medium, design: .rounded))
												Text("Ms. Harrison!")
														.font(.system(size: 36, weight: .heavy, design: .rounded))
										}
										.foregroundColor(.black.opacity(0.85))
										.padding(.horizontal, 30)
										.padding(.top, 20)
								}
								.frame(height: 220)
								
								ScrollView {
										VStack(spacing: 20) {
												
												Button("Treasure Hunt") {
														print("Treasure Hunt tapped")
												}
												.buttonStyle(ActivityButtonStyle(color: .mainButton))
												
												Button("Burrow Adventures") {
														print("Burrow Adventures tapped")
												}
												.buttonStyle(ActivityButtonStyle(color: .tertiaryButton))
												NavigationLink(destination: GameScreenView()) {
														Text("Physical Challenges")
												}
												.buttonStyle(ActivityButtonStyle(color: .secondaryButton))
												
										}
										.padding(.horizontal, 25)
										.padding(.top, 40)
								}
								
								Spacer()
						}
						.navigationBarBackButtonHidden(true)
						.background(Color.white)
				}
}

#Preview {
		TeacherHomeScreenView()
}
