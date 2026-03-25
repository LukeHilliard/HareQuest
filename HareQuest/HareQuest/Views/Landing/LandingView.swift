//
//  LandingView.swift
//  HareQuest
//
//  Created by Luke Hilliard on 23/03/2026.
//

import SwiftUI

struct LandingView: View {
	@StateObject private var controller = LandingController()

	var body: some View {
		NavigationStack {
			VStack {
				Button("Login") {
					controller.openLoginView()
				}.buttonStyle(.bordered)
				Button("Register") {
					controller.openRegisterView()
				}.buttonStyle(.bordered)
			}
			.navigationDestination(isPresented: $controller.showLogin) { LoginView() }
			.navigationDestination(isPresented: $controller.showRegister) { RegisterView() }
			
		}.navigationBarBackButtonHidden(true)
		
	}
}

#Preview {
    LandingView()
}
