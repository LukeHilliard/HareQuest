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

			NavigationStack {
				HStack {
					Button("Register") {
						// TODO: Implement controller logic
						controller.registerNewUser()
					}.buttonStyle(.bordered)
					
					Button("Return") {
						dismiss()
					}.buttonStyle(.bordered)
				}
			}.navigationDestination(isPresented: $controller.isRegistered) { LoginView() }
			
			Spacer()
		}.navigationBarBackButtonHidden(true)
	
	}
}

#Preview {
    RegisterView()
}
