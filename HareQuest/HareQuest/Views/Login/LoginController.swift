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

class LoginController: ObservableObject {
	
	@Published var email: String = ""
	@Published var password: String = ""
	@Published var showLanding: Bool = false
	@Published var isLoggedIn: Bool = false
	
	let apiService = ApiService()
	let keychain = KeychainSwift()
	
	// TODO: Implement user login, UserDefaults, Keychain
	func LoginUser() {
		let requestBody = LoginDto(email: email, password: password)
		do {
			let data = try JSONEncoder().encode(requestBody)
			apiService.post(endpoint: "Auth/login", body: data) { result in
				switch result {
					case .success(let data):
						do {
							let response = try JSONDecoder().decode(RegisterResponseDto.self, from: data)
							print("Successfully registered user")
							print(response)
							
							/// Add details to keychain
							self.keychain.set(response.accessToken ?? "", forKey: "hq_token")
							DispatchQueue.main.async {
								self.isLoggedIn = true
							}
							
						} catch {
							print("Decoding Error: \(error.localizedDescription)")
						}
					case .failure(let error):
						// TODO: Figure out how to decode error returned from API
						print("Failed to register user")
						print("ERROR: \(error.localizedDescription)")
				}
			}
		} catch {
			print("Encoding Error: \(error.localizedDescription)")
		}
	}
	
	func openLandingView() {
		showLanding = true
	}
}
