//
//  TeachersCornerController.swift
//  HareQuest
//
//  Created by Luke Hilliard on 13/04/2026.
//

import Foundation
import SwiftUI
import Combine
import KeychainSwift

@MainActor
final class TeachersCornerController: ObservableObject {
	/// Routes
	enum TCornerRoute: Hashable {
		case createClass
	}
	@Published var currentRoute: TCornerRoute?
	
	/// UI Elements
	enum ClassGroup: String, CaseIterable {
		case first = "1st"
		case second = "2nd"
		case third = "3rd"
		case fourth = "4th"
		case fifth = "5th"
		case sixth = "6th"
	}
	
	
	@Published var className: String = ""
	@Published var classGroup: ClassGroup = .first
	
	/// Services
	private let classGroupsService = ClassGroupsService.shared
	private let sessionManager = SessionManager.shared
	let keychain = KeychainSwift()
	
	func createClassGroup() async throws -> Void {
		
		/// Unwrap userId from keychain, convert from String -> UUID
		guard let teacherIdString = keychain.get("hq_userId") else { sessionManager.clear(); return }
		guard let teacherId = UUID(uuidString: teacherIdString) else { sessionManager.clear(); return }
		
		let classDetails = ClassGroupDto(teacherId: teacherId, className: className, classLevel: classGroup.rawValue)
		do {
			let classGroupResponse = try await classGroupsService.generateClassCode(classDetails: classDetails)
			switch classGroupResponse.success {
			case true:
				print(classGroupResponse)
			case false:
				// TODO: Handle this failure
				print("Failed to create class")
			}
		}
		
	}
	
//	func login() async throws -> Void {
//		let loginDetails = LoginDto(email: email, password: password)
//		
//		do {
//			let loginResponse = try await authService.login(loginDetails: loginDetails)
//			
//			switch loginResponse.success {
//			case true:
//				print(loginResponse)
//				if let token = loginResponse.accessToken {
//					/// Store token on keychian
//					keychain.set(token, forKey: "hq_token")
//					keychain.set(String(describing: loginResponse.userId), forKey: "hq_userId")
//					sessionManager.refreshToken(token: token)
//					
//					/// Store role on keychain
//					if let role = loginResponse.role { sessionManager.setRole(role: role) }
//				} else {
//					sessionManager.isAuth = false
//					print("Login response missing access token")
//					return
//				}
//				
//				openHomeView()
//			case false:
//				sessionManager.isAuth = false
//				print("Login Failed")
//				// TODO: Show API error message on screen
//			}
//		} catch {
//			print("Error: \(error)")
//		}
//	}
	func openAddClassView() { currentRoute = .createClass }
}

