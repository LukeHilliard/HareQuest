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


@MainActor
class LoginController: ObservableObject {
	/// Routes
	enum LoginRoute: Hashable {
		case landing
		case home
	}
	
	@Published var email: String = ""
	@Published var password: String = ""
	//	@Published var showLanding: Bool = false
	//	@Published var isLoggedIn: Bool = false
	
	@Published var currentRoute: LoginRoute?
	
	
//	private let apiService = ApiService()
	private let authService = AuthService.shared
	private let keychain = KeychainSwift()
	
	func openHomeView() { currentRoute = .home }
	func openLandingView() { currentRoute = .landing }
	
	
	func login() async throws -> Void {
		print("trying to log in")
		let loginDetails = LoginDto(email: email, password: password)
		print("after details built")
		
		do {
			let loginResponse = try await authService.login(loginDetails: loginDetails)
			print("after repsonse")
			
			switch loginResponse.success {
			case true:
				print(loginResponse)
				keychain.set(loginResponse.accessToken ?? "", forKey: "hq_token")
				self.openHomeView()
			case false:
				// TODO: Handle failed login
				print("Login Failed")
				
			}
		} catch {
			print("Error: \(error)")
		}
	}
	
}
	
	// TODO: Implement user login, UserDefaults, Keychain
//	func LoginUser() {
//		let requestBody = LoginDto(email: email, password: password)
//		do {
//			let data = try JSONEncoder().encode(requestBody)
//			apiService.post(endpoint: "Auth/login", body: data) { result in
//				switch result {
//					case .success(let data):
//						do {
//							let response = try JSONDecoder().decode(RegisterResponseDto.self, from: data)
//							print("Successfully registered user")
//							print(response)
//							
//							/// Add details to keychain
//							self.keychain.set(response.accessToken ?? "", forKey: "hq_token")
//							DispatchQueue.main.async {
//								self.isLoggedIn = true
//							}
//							
//						} catch {
//							print("Decoding Error: \(error.localizedDescription)")
//						}
//					case .failure(let error):
//						// TODO: Figure out how to decode error returned from API
//						print("Failed to register user")
//						print("ERROR: \(error.localizedDescription)")
//				}
//			}
//		} catch {
//			print("Encoding Error: \(error.localizedDescription)")
//		}
//	}
//

	
//		do {
//			let response = try await authService.login(loginDetails: loginDetails)
//			
//		
//			if let token = response.accessToken, token == ""{
//					keychain.set(token, forKey: "hq_token")
//			}
//			print(response)
//		} catch {
//			print("Login failed: \(error.localizedDescription)")
//			throw error
//		}

