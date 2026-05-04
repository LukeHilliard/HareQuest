//
//  ClassGroupsService.swift
//  HareQuest
//
//  Created by Luke Hilliard on 16/04/2026.
//
//


import Foundation
import KeychainSwift

class ClassGroupsService {
	static let shared = ClassGroupsService()
	
	let baseUrl = "http://localhost:5092/api/ClassGroups/"
	let keychain = KeychainSwift()
	let session = URLSession.shared
	
	public init() {}
	
	
	func generateClassCode(classDetails: ClassGroupDto) async throws -> ClassGroupResponse {
		
		
		/// Build URL
		guard let url = URL(string: "\(baseUrl)createClass") else {
			throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
		}
		print("Service requesting - \(url)")
		
		/// Build request
		var request = URLRequest(url: url)
		let requestBody = try JSONEncoder().encode(classDetails)
		request.httpMethod = "POST"
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		request.httpBody = requestBody
		
		/// Make request and decode to reponse object
		let (data, _) = try await session.data(for: request)
		let response = try JSONDecoder().decode(ClassGroupResponse.self, from: data)
		
		guard response.success == true else {
			throw NSError(domain: "ClassGroups", code: response.status, userInfo: [NSLocalizedDescriptionKey: response.message])
		}
		
		return response
	}
	
	func joinClassGroup(joinDetails: JoinClassDto) async throws -> JoinClassResponse {
		guard let url = URL(string: "\(baseUrl)joinClass") else {
			throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
		}
		print("Service requesting - \(url)")
		
		/// Build request
		var request = URLRequest(url: url)
		let requestBody = try JSONEncoder().encode(joinDetails)
		request.httpMethod = "POST"
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		request.httpBody = requestBody
		
		/// Make request and decode to reponse object
		let (data, _) = try await session.data(for: request)
		let response = try JSONDecoder().decode(JoinClassResponse.self, from: data)
		print(response)
		guard response.success == true else {
			throw NSError(domain: "ClassGroups", code: response.status, userInfo: [NSLocalizedDescriptionKey: response.message])
		}

		return response
		
	}
}

