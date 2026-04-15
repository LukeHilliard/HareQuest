//
//  LoginController.swift
//  HareQuest
//
//  Created by Luke Hilliard on 23/03/2026.
//

import Foundation
import SwiftUI
import Combine
import KeychainSwift
import SwiftData

@MainActor
class LoginController: ObservableObject {
	/// Routes
	enum LoginRoute: Hashable {
		case landing
		case home
	}
	@Published var currentRoute: LoginRoute?
	
	/// UI Elements
	@Published var email: String = ""
	@Published var password: String = ""

	/// Services
	private let authService = AuthService.shared
	private let sessionManager = SessionManager.shared
	private let keychain = KeychainSwift()
	
	
	func openHomeView() { currentRoute = .home }
	func openLandingView() { currentRoute = .landing }
	
	func login() async throws -> Void {
		let loginDetails = LoginDto(email: email, password: password)
		
		do {
			let loginResponse = try await authService.login(loginDetails: loginDetails)
			
			switch loginResponse.success {
			case true:
				print(loginResponse)
				if let token = loginResponse.accessToken {
					/// Store token on keychian
					keychain.set(token, forKey: "hq_token")
					keychain.set(String(describing: loginResponse.userId), forKey: "hq_userId")
					sessionManager.refreshToken(token: token)
					
					/// Store role on keychain
					if let role = loginResponse.role { sessionManager.setRole(role: role) }
				} else {
					sessionManager.isAuth = false
					print("Login response missing access token")
					return
				}
				
				openHomeView()
			case false:
				sessionManager.isAuth = false
				print("Login Failed")
				// TODO: Show API error message on screen
			}
		} catch {
			print("Error: \(error)")
		}
	}
	
}
