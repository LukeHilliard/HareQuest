//
//  ApiService.swift
//  HareQuest
//
//  Created by Luke Hilliard on 20/03/2026.
//
//
// Api Service layer followed here: https://medium.com/@bhavesh.sachala/building-a-versatile-network-layer-in-swiftui-with-apiservice-11fe7ec278fc
import Foundation
import KeychainSwift

class ApiService {
	private let baseUrl = "http://localhost:5092/api/"
	let keychain = KeychainSwift()
	
	public init() {}
	
	/// Helper method to construct the URL
	private func getUrl(endpoint: String) -> URL? {
		return URL(string: "\(baseUrl)\(endpoint)")
	}
	
	/// Placeholder for access token
	private func accessToken() -> String {
		guard let token = keychain.get("hq_token") else {
			print("No token")
			return "no-token"
		}
		return token
	}
	
	/// Contruct HTTP Headers
	private func headers() -> [String: String] {
		return [
			"Content-Type": "application/json",
			"Authorization": "Bearer \(accessToken())"
		]
	}
	
	/// Handle HTTP responses and errors
	private func sendRequest(_ request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
		let task = URLSession.shared.dataTask(with: request) { data, response, error in
			/// Handle error returned from API
			if let error = error {
				print("Error during API call | Endpoint-\(request.url?.absoluteString ?? "URL Unavailable") | Error: \(error)")
				completion(.failure(error))
				return
			}
			
			/// Handle HTTP error
			if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
				if response.statusCode == 401 || response.statusCode == 403 {
					self.handleUnauthorizedAccess()
				}
				let error = NSError(domain: "HTTPError", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: "HTTP Error \(response.statusCode)"])
				completion(.failure(error))
				return
			}
			completion(.success(data!))
		}
		task.resume()
	}
	
	/// Helper function to handle unauthorized access
	private func handleUnauthorizedAccess() {
		print("Unauthorized Access Detected.")
		// TODO: Implement logic for token/logut
	}
	/// GET
	func get(endpoint: String, completion: @escaping (Result<Data, Error>) -> Void) {
		guard let url = getUrl(endpoint: endpoint) else { return }
		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		request.allHTTPHeaderFields = headers()
		sendRequest(request, completion: completion)
	}
	/// POST
	func post(endpoint: String, body: Data?, completion: @escaping (Result<Data, Error>) -> Void) {
		guard let url = getUrl(endpoint: endpoint) else { return }
		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		request.allHTTPHeaderFields = headers()
		request.httpBody = body
		
		sendRequest(request, completion: completion)
	}
	
	/// PUT
	func put(endpoint: String, completion: @escaping (Result<Data, Error>) -> Void) {
		guard let url = getUrl(endpoint: endpoint) else { return }
		var request = URLRequest(url: url)
		request.httpMethod = "PUT"
		request.allHTTPHeaderFields = headers()
		sendRequest(request, completion: completion)
	}
	
	/// PATCH
	func patch(endpoint: String, completion: @escaping (Result<Data, Error>) -> Void) {
		guard let url = getUrl(endpoint: endpoint) else { return }
		var request = URLRequest(url: url)
		request.httpMethod = "PATCH"
		request.allHTTPHeaderFields = headers()
		sendRequest(request, completion: completion)
	}
	
	
	/// DELETE
	func delete(endpoint: String, completion: @escaping (Result<Data, Error>) -> Void) {
		guard let url = getUrl(endpoint: endpoint) else { return }
		var request = URLRequest(url: url)
		request.httpMethod = "DELETE"
		request.allHTTPHeaderFields = headers()
		sendRequest(request, completion: completion)
	}
}
