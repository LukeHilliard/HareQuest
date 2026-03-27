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
	
	private let keychain = KeychainSwift()
	
	init() {
		checkToken()
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
	
	func clear() {
		keychain.delete("hq_token")
		self.isAuth = false
	}
}
