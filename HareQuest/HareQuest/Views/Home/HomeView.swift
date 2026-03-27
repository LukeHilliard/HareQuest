//
//  HomeView.swift
//  HareQuest
//
//  Created by Luke Hilliard on 23/03/2026.
//

import SwiftUI

struct HomeView: View {
	@StateObject private var controller = HomeController()

	
	var body: some View {
		
		
		// TODO: Handle different tabs based on parent/teacher role
		TabView(selection: $controller.selectedTab) {
			Tab("Parent's Corner", systemImage: "person.3.fill", value: HomeController.HomeTabs.parentsCorner) { ParentsCornerView() }
			Tab("Activities", systemImage: "map.fill", value: HomeController.HomeTabs.activities) { }
			Tab("Profile", systemImage: "person.crop.circle", value: HomeController.HomeTabs.profile) { ProfileView() }
		}
		
	
	}
}

#Preview {
    HomeView()
}
