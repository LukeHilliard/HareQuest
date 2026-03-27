//
//  ProfileView.swift
//  HareQuest
//
//  Created by Luke Hilliard on 27/03/2026.
//

import SwiftUI

struct ProfileView: View {
	@StateObject private var controller = ProfileController()
	
    var body: some View {
			Button("Logout") {
				controller.logout()
			}
    }
}

#Preview {
    ProfileView()
}
