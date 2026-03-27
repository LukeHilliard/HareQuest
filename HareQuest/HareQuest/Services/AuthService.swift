//
//  AuthService.swift
//  HareQuest
//
//  Created by Luke Hilliard on 26/03/2026.
//

import Foundation
import KeychainSwift

class AuthService {
	static let shared = AuthService()
	
	let baseUrl = "http://localhost:5092/api/Auth"
	let keychain = KeychainSwift()
	let session = URLSession.shared
	
	public init() {}
	
	func login(loginDetails: LoginDto) async throws -> LoginResponseDto {
		print("Starting login from AuthService")
		
		/// Build url
		guard let url = URL(string: "\(baseUrl)/login") else {
			throw NSError(domain: "Invalid URL when logging in", code: 0, userInfo: nil)
		}
		print("after guard")
		/// Build request
		var request = URLRequest(url: url)
		let requestBody = try JSONEncoder().encode(loginDetails)
		request.httpMethod = "POST"
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		request.httpBody = requestBody
		print("before request")
		/// Make request and decode to response object
		let (data, _) = try await session.data(for: request)
		
		
		let response = try JSONDecoder().decode(LoginResponseDto.self, from: data)
		print("after request")
		
		/// API returns true or false + status code
		guard response.success == true else {
			throw NSError(domain: "Auth", code: response.status, userInfo: [NSLocalizedDescriptionKey: response.message])
		}
		return response /// UI works off success (true/false)
	}
	
	func register(registerDetails: RegisterDto) async throws -> RegisterResponseDto {
		/// Build url
		guard let url = URL(string: "\(baseUrl)/register") else {
			throw NSError(domain: "Invalid URL when logging in", code: 0, userInfo: nil)
		}
		/// Build request
		var request = URLRequest(url: url)
		let requestBody = try JSONEncoder().encode(registerDetails)
		request.httpMethod = "POST"
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		request.httpBody = requestBody
		
		/// Make request and decode to response object
		let (data, _) = try await session.data(for: request)
		let response = try JSONDecoder().decode(RegisterResponseDto.self, from: data)
		
		/// API returns true or false + status code
		guard response.success == true else {
			throw NSError(domain: "Auth", code: response.status, userInfo: [NSLocalizedDescriptionKey: response.message])
		}
		return response /// UI works off success (true/false)
	}
	
	
	
}
