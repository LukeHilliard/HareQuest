//
//  SessionManager.swift
//  HareQuest
//
//  Created by Luke Hilliard on 27/03/2026.
//

import Foundation
import KeychainSwift
import Combine

@MainActor
final class SessionManager: ObservableObject {
	static let shared = SessionManager()
	
	@Published var isAuth: Bool = false
	@Published var identifier: UUID?
	
	
	private let keychain = KeychainSwift()
	
	init() {
		checkToken()
		if let id = getId() {
			self.identifier = id
		} else {
			self.identifier = nil
		}
	}
	
	func logout() {
		keychain.clear()
		self.isAuth = false
		self.identifier = nil
	}
	
	
	func checkToken() {
		if let token = keychain.get("hq_token"), !token.isEmpty {
			self.isAuth = true
		} else {
			self.isAuth = false
		}
	}
	
	func refreshToken(token: String) {
		keychain.set(token, forKey: "hq_token")
		self.isAuth = true
	}
	
	func getId() -> UUID? {
		print("Getting ID from Session")
		if let idString = keychain.get("hq_userId"), let uuid = UUID(uuidString: idString) {
			return uuid
		}
		return nil
	}
	func setName(name: String) {
		keychain.set(name, forKey: "hq_name")
	}
	func setRole(role: String) {
		keychain.set(role, forKey: "hq_role")
	}
	
	func getName() -> String? {
		if let name = keychain.get("hq_name") {
			return name
		}
		return nil
		
	}
	
	func getRole() -> String? {
		if let role = keychain.get("hq_role") {
			return role
		}
		return nil
		
	}
}
