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
		NavigationStack { /// Parent navigation stack, this is passed to all child view (pretty much every view)
			VStack {
				Button("Login") {
					controller.openLoginView()
				}.buttonStyle(.bordered)
				Button("Register") {
					controller.openRegisterView()
				}.buttonStyle(.bordered)
			}
			.navigationDestination(item: $controller.currentRoute) { route in
				switch route {
					case .login:
					LoginView()
				case .register:
					RegisterView()
				}
			}
			
		}.navigationBarBackButtonHidden(true)
		
	}
}

#Preview {
    LandingView()
}
