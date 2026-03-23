//
//  LoginView.swift
//  HareQuest
//
//  Created by Luke Hilliard on 23/03/2026.
//

import SwiftUI

struct LoginView: View {
	@StateObject private var controller = LoginController()
	var body: some View {
		VStack {
			Text("Login")
				.font(.title)
				.bold()
				.padding(.bottom)
			
			TextField("Email", text: $controller.email)
							.textFieldStyle(.roundedBorder)
							.keyboardType(.emailAddress)
			
			SecureField("Password", text: $controller.password)
							.textFieldStyle(.roundedBorder)
			
			HStack {
				Button("Login") {
					// TODO: Implement controller logic
					controller.LoginUser()
				}.buttonStyle(.bordered)
				
				Button("Return") {
					controller.openLandingView()
				}
			}.navigationDestination(isPresented: $controller.showLanding) { LandingView() }
			
			
			Spacer()
		}.navigationBarBackButtonHidden(true)
		
	}
}

#Preview {
    LoginView()
}
