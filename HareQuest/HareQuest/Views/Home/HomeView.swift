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
		switch controller.role {
		case "parent":
			TabView(selection: $controller.selectedTab) {
				Tab("Parent's Corner", systemImage: "person.3.fill", value: HomeController.HomeTabs.parentsCorner) { ParentsCornerView() }
				Tab("Activities", systemImage: "map.fill", value: HomeController.HomeTabs.activities) { }
				Tab("Profile", systemImage: "person.crop.circle", value: HomeController.HomeTabs.profile) { ProfileView() }
			}
		case "teacher":
			TabView(selection: $controller.selectedTab) {
				Tab("Teacher's Corner", systemImage: "person.3.fill", value: HomeController.HomeTabs.teachersCorner) { TeachersCornerView() }
				Tab("Activities", systemImage: "map.fill", value: HomeController.HomeTabs.activities) { }
				Tab("Profile", systemImage: "person.crop.circle", value: HomeController.HomeTabs.profile) { ProfileView() }
			}
		default:
			// TODO: check this handes correctly. If no role is found, clear the users session and logout
			Text("No role found")
			Button("Logout") {
				controller.sessionManager.clear()
			}
		}
		
	}
}

#Preview {
    HomeView()
}
