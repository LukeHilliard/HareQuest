//
//  HomeController.swift
//  HareQuest
//
//  Created by Luke Hilliard on 23/03/2026.
//

import Foundation
import SwiftUI
import Combine
import KeychainSwift

class HomeController: ObservableObject {
	
	@Published var acessToken: String? = nil
	@Published var users: [User]
	let keychain = KeychainSwift()
	let apiService = ApiService()


	
//	func getAllUser() async throws -> [User] {
//		let users = if keychain.get("hq_token") == "" {
//			
//		}
//	}
	
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
	
	init() {
		acessToken = keychain.get("hq_token")
		self.users = []
	}
	
}
