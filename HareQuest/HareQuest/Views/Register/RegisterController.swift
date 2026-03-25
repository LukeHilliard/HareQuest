//
//  RegisterController.swift
//  HareQuest
//
//  Created by Luke Hilliard on 23/03/2026.
//

import Foundation
import SwiftUI
import Combine


class RegisterController: ObservableObject {
	enum Role: String, Hashable, CaseIterable {
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
	
	
	let apiService = ApiService()

	
	func registerNewUser() {
		let requestBody = RegisterDto(name: name, email: email, password: password, role: role.rawValue)
		print(requestBody)
		
		// TODO: Handle empty input boxes
		if(name == "" || email == "" || password == "") {
			print("Input Missing")
		} else {
			do {
				let data = try JSONEncoder().encode(requestBody)
				apiService.post(endpoint: "Auth/register", body: data) { result in
					switch result {
						case .success(let data):
							do {
								let response = try JSONDecoder().decode(RegisterResponseDto.self, from: data)

								print("Successfully registered user")
								print(response)
								
								DispatchQueue.main.async {
									self.isRegistered = true
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
	}
	
//	func getAllUsers() {
//		apiService.get(endpoint: "Users") { result in
//			switch result {
//			case .success(let data):
//				do {
//					let users = try JSONDecoder().decode([User].self, from: data)
//					print(users)
//				} catch {
//					print("Decoding error: \(error.localizedDescription)")
//				}
//			case .failure(let error):
//				print("API Error: \(error.localizedDescription)")
//			}
//		}
//	}
	
	func openLandingView() {
		showLanding = true
	}
}

