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
				.font(.largeTitle)
                .foregroundStyle(.secondaryTitle)
				.bold()
				.padding(.bottom)
			
			TextField("Name", text: $controller.name)
                .font(.title3)
                .fontWeight(.bold)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(50)
                .shadow(color: Color.secondaryTitle.opacity(0.25), radius: 0, x:0, y:7)
                .shadow(color: Color.secondaryTitle.opacity(0.08), radius: 10, x:0, y:-7)
                .padding(.bottom)
                .autocapitalization(.none)
			
			TextField("Email", text: $controller.email)
                .font(.title3)
                .fontWeight(.bold)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(50)
                .shadow(color: Color.secondaryTitle.opacity(0.25), radius: 0, x:0, y:7)
                .shadow(color: Color.secondaryTitle.opacity(0.08), radius: 10, x:0, y:-7)
                .padding(.bottom)
                .autocapitalization(.none)
			
			SecureField("Password", text: $controller.password)
                .font(.title3)
                .fontWeight(.bold)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(50)
                .shadow(color: Color.secondaryTitle.opacity(0.25), radius: 0, x:0, y:7)
                .shadow(color: Color.secondaryTitle.opacity(0.08), radius: 10, x:0, y:-7)
               
                .autocapitalization(.none)
			
            HStack {
                Text("I am a")
                    .font(.title3)
                Picker("Role", selection: $controller.role) {
                    ForEach(RegisterController.Role.allCases, id: \.self) { role in
                        Text(role.rawValue).tag(role)
                          
                    }
                }
                .font(.headline)
                .padding(.vertical)
                .pickerStyle(.segmented)
                .shadow(color: Color.secondaryTitle.opacity(0.25), radius: 0, x:0, y:3)
               
              
            }.padding(.bottom)


			
            Button("Register") {
                Task {
                    try await controller.register()
                }
            }.buttonStyle(SecondaryButtonStyle())
                    
					
               
				
            HStack {
                Text("Already have an account?")
                Button("Log in") {
                    controller.openLoginView()
                }
                
                .foregroundStyle(.secondaryTitle)
            }
            .padding()
		
        }.padding()
		.navigationDestination(item: $controller.currentRoute) { route in
			switch route {
					case .login:
						LoginView()
					case .landing:
						LandingView()
				}
			}
		.navigationBarBackButtonHidden(true)
	}
}

#Preview {
    RegisterView()
}
