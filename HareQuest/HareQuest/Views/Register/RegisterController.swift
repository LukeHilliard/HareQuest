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
		case parent = "Parent" /// default
		case teacher = "Teacher"
		case student = "Student"
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
			openLoginView()
		case false:
			print("Register Failed")
		}
	}
	

	
}
	


//	func registerNewUser() {
//		let requestBody = RegisterDto(name: name, email: email, password: password, role: role.rawValue)
//		print(requestBody)
//		
//		// TODO: Handle empty input boxes
//		if(name == "" || email == "" || password == "") {
//			print("Input Missing")
//		} else {
//			do {
//				let data = try JSONEncoder().encode(requestBody)
//				apiService.post(endpoint: "Auth/register", body: data) { result in
//					switch result {
//						case .success(let data):
//							do {
//								let response = try JSONDecoder().decode(RegisterResponseDto.self, from: data)
//
//								print("Successfully registered user")
//								print(response)
//								
//								DispatchQueue.main.async {
//									self.isRegistered = true
//								}
//							} catch {
//								print("Decoding Error: \(error.localizedDescription)")
//							}
//						case .failure(let error):
//							// TODO: Figure out how to decode error returned from API
//							print("Failed to register user")
//							print("ERROR: \(error.localizedDescription)")
//					}
//				}
//			} catch {
//				print("Encoding Error: \(error.localizedDescription)")
//			}
//		}
//	}


