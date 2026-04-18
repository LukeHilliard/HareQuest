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
	enum ClassLevel: String, CaseIterable {
		case first = "1st"
		case second = "2nd"
		case third = "3rd"
		case fourth = "4th"
		case fifth = "5th"
		case sixth = "6th"
	}
	
	
	@Published var name: String = ""
	@Published var classLevel: ClassLevel = .first
	
	init() {}
	
	/// Services
	let classGroupsService = ClassGroupsService.shared
	let sessionManager = SessionManager.shared
	let keychain = KeychainSwift()
	
	func createClassGroup() async throws -> ClassGroup {
		/// Unwrap userId from keychain, convert from String -> UUID
		guard let teacherIdString = keychain.get("hq_userId"),
			let teacherId = UUID(uuidString: teacherIdString) else {
			sessionManager.logout()
			throw NSError(domain: "Auth", code: 1, userInfo: [NSLocalizedDescriptionKey: "No ID in session"])
		}
		print(teacherIdString)
		
		/// Build class group from UI
		let classDetails = ClassGroupDto(
			teacherId: teacherId,
			name: self.name,
			classLevel: self.classLevel.rawValue
		)
		/// Make request, add class to db and recieve a code to join class
		let classGroupResponse = try await classGroupsService.generateClassCode(classDetails: classDetails)
		if classGroupResponse.success {
			print("Successfully generated code: \(classGroupResponse.classCode)")
			return ClassGroup(
					id: classGroupResponse.id,
					teacherId: teacherId,
					name: classGroupResponse.name,
					classCode: classGroupResponse.classCode,
					classLevel: classGroupResponse.classLevel,
					students: nil
			)
		} else {
			throw NSError(domain: "ClassGroups", code: classGroupResponse.status, userInfo: [NSLocalizedDescriptionKey: classGroupResponse.message])
		}
		
	}
	
	
	func openAddClassView() { currentRoute = .createClass }
}

