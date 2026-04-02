//
//  LoginView.swift
//  HareQuest
//
//  Created by Luke Hilliard on 23/03/2026.
//

import SwiftUI


struct LoginView: View {
	@StateObject private var controller = LoginController()
	@Environment(\.dismiss) var dismiss /// Access NavigationStack built in function 'dismiss'
	
	
	var body: some View {
		VStack {
			Text("Login")
				.font(.title)
				.bold()
				.padding(.bottom)
			
			TextField("Email", text: $controller.email)
							.textFieldStyle(.roundedBorder)
							.keyboardType(.emailAddress)
							.autocapitalization(.none)
			
			SecureField("Password", text: $controller.password)
							.textFieldStyle(.roundedBorder)
							.autocapitalization(.none)
			
				HStack {
					Button("Login") {
						Task {
							try await controller.login()
						}
					}.buttonStyle(.bordered)
					
					Button("Return") {
						dismiss()
					}
				}
			Spacer()
		}
		.navigationDestination(item: $controller.currentRoute) { route in
			switch route {
				case .home:
					HomeView()
				case .landing:
					LandingView()
			}
		}
		.navigationBarBackButtonHidden(true)
		
	}
}

#Preview {
    LoginView()
}
