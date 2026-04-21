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
			Text("Log in")
				.font(.largeTitle)
                .foregroundStyle(.accentTitle)
				.bold()
				.padding(.bottom)
			
			TextField("Email", text: $controller.email)
                .font(.title3)
                .fontWeight(.bold)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(50)
                .shadow(color: Color.accentTitle.opacity(0.2), radius: 0, x:0, y:7)
                .shadow(color: Color.accentTitle.opacity(0.08), radius: 10, x:0, y:-7)
                .padding(.bottom)
							.keyboardType(.emailAddress)
							.autocapitalization(.none)
                           
			
			SecureField("Password", text: $controller.password)
                .font(.title3)
                .fontWeight(.bold)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(50)
                .shadow(color: Color.accentTitle.opacity(0.2), radius: 0, x:0, y:7)
                .shadow(color: Color.accentTitle.opacity(0.08), radius: 10, x:0, y:-7)
                .padding(.bottom)
                .autocapitalization(.none)
			
				VStack {
					Button("Login") {
						Task {
							try await controller.login()
						}
					}.buttonStyle(DefaultButtonStyle())
					
					
				}
            
            HStack {
                Text("No account yet?")
                Button("Register") {
                    controller.openRegisterView()
                }
                
                .foregroundStyle(.accentTitle)
            }
			
        }.padding()
		.navigationDestination(item: $controller.currentRoute) { route in
			switch route {
				case .home:
					HomeView()
				case .landing:
					LandingView()
            case .register:
                RegisterView()
			}
		}
		.navigationBarBackButtonHidden(true)
		
	}
}

#Preview {
    LoginView()
}
