//
//  ParentHomeScrenView.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 27/04/2026.
//

import SwiftUI

struct ParentHomeScreenView: View {
	@StateObject private var controller = HomeController()
    var body: some View {
			NavigationStack {
				VStack {
						ZStack {
								
								Image("HomeBGImage")
										.resizable()
										.scaledToFill()
										.frame(minWidth: 0)
										.edgesIgnoringSafeArea(.top)
								HStack {
										
										
										VStack(alignment: .leading) {
												Spacer()
												Text("Good morning")
											Text(controller.sessionManager.getName() ?? "Parent") // TODO Put actual name of student
												
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
								Button("Hareobics with Harper"){
									controller.openGameScreen()
								}.buttonStyle(GameButtonStyle(color: .secondaryButton, gameIcon: Image("HareobicsImage"))).padding(.top)
						}.padding(.horizontal)
								.padding(.vertical, 70)
					
				}
				.navigationDestination(item: $controller.currentRoute) { route in
					switch route {
					 case .hareobics:
							 GameScreenView()
					 }
				 }
			}
    }
}

#Preview {
    ParentHomeScreenView()
}
