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
			
			Button("Logout") {
				controller.sessionManager.clear()
			}
		
    }
}

#Preview {
    HomeView()
}
