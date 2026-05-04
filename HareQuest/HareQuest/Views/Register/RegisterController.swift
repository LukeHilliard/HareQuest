//
//  RegisterController.swift
//  HareQuest
//
//  Created by Luke Hilliard on 23/03/2026.
//

import Foundation
import SwiftUI
import Combine


@MainActor
final class RegisterController: ObservableObject {
	enum RegisterRoute: Hashable {
		case landing
		case login
        
	}
	
	enum Role: String, Codable, CaseIterable {
		case parent = "parent" /// default
		case teacher = "teacher"
	}
	/// Input elements
	@Published var name: String = ""
	@Published var email: String = ""
	@Published var password: String = ""
	@Published var role: Role = .parent
	
	/// Navigation elements
	@Published var isRegistered: Bool = false
	@Published var showLanding: Bool = false
	@Published var currentRoute: RegisterRoute?
	
	/// Services
	let authService = AuthService.shared
	
	/// Navigation
	func openLoginView() { currentRoute = .login }
	func openLandingView() { currentRoute = .landing }
	
	/// Uses AuthService to call /Auth/register, passes register details. Returns true or false representing success
	func register() async throws -> Void {
		print("registering")
		let registerDetails = RegisterDto(name: name, email: email, password: password, role: role.rawValue)
		
		let registerResponse = try await authService.register(registerDetails: registerDetails)
		switch registerResponse.success {
		case true:
			print(registerResponse)
			var loginController = LoginController()
			try await loginController.login(email: email, password: password)
	
		case false:
			print("Register Failed")
		}
	}
	
	
}
