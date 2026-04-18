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
		self.identifier = try? getId()
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
	
	func getId() throws -> UUID? {
		if let id = keychain.get("hq_userId") {
			guard let convertedId = UUID(uuidString: id) else { throw NSError(domain: "Auth", code: 0, userInfo: nil) }
			return convertedId
		}
		return nil
	}
	
	func setRole(role: String) {
		keychain.set(role, forKey: "hq_role")
	}
	
}
