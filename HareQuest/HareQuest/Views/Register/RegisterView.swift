//
//  RegisterView.swift
//  HareQuest
//
//  Created by Luke Hilliard on 23/03/2026.
//

import SwiftUI

struct RegisterView: View {
	@StateObject private var controller = RegisterController()

	@Environment(\.dismiss) var dismiss /// Access NavigationStack built in function 'dismiss'
	var body: some View {
		VStack {
			Text("Register")
				.font(.title)
				.bold()
				.padding(.bottom)
			
			TextField("Name", text: $controller.name)
							.textFieldStyle(.roundedBorder)
							.keyboardType(.default)
			
			TextField("Email", text: $controller.email)
							.textFieldStyle(.roundedBorder)
							.keyboardType(.emailAddress)
			
			SecureField("Password", text: $controller.password)
							.textFieldStyle(.roundedBorder)
			
			Picker("Role", selection: $controller.role) {
				ForEach(RegisterController.Role.allCases, id: \.self) { role in
					Text(role.rawValue)
				}
			}.buttonStyle(.bordered)


				HStack {
					Button("Register") {
						Task { 
							try await controller.register()
						}
					}.buttonStyle(.bordered)
					
					Button("Return") {
						dismiss()
					}.buttonStyle(.bordered)
				}.navigationDestination(item: $controller.currentRoute) { route in
					switch route {
						case .login:
							LoginView()
						case .landing:
							LandingView()
					}
				}
			Spacer()
		}.navigationBarBackButtonHidden(true)
	}
}

#Preview {
    RegisterView()
}
