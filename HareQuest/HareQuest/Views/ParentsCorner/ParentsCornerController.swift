//
//  ParentsCornerController.swift
//  HareQuest
//
//  Created by Luke Hilliard on 26/03/2026.
//

import Foundation
import SwiftUI
import Combine
import KeychainSwift
import SwiftData

@MainActor
class ParentsCornerController: ObservableObject {	
	/// Routes
	enum PCornerRoute: Hashable {
		case addChild
	}
	@Published var currentRoute: PCornerRoute?
	
	/// UI Elements
	@Published var parentsChildren: [Student]?
	@Published var hasChildren = false
	
	@Published var childName: String = ""
	@Published var childClass: ChildClass = .first
	@Published var childClassCode: String = ""
	
	// Services
	@Published var sessionManager = SessionManager.shared
	private let keychain = KeychainSwift()
	private let classGroupService = ClassGroupsService()
	
	func openAddChildView() { currentRoute = .addChild }
	
	func joinClass(studentName: String, modelContext: ModelContext) async throws -> Void {
//		print("STUDENT ID \(studentId)")

		// Retrieve the parent ID from the session. If unavailable, log and return.
		guard let parentId = sessionManager.getId() else {
			print("Error: No valid parent identifier in session.")
			return
		}
		print(studentName)
		let joinDetails = JoinClassDto(
			classCode: self.childClassCode,
			classLevel: self.childClass,
			parentId: parentId,
			studentName: studentName
		)
		
		do {
			let joinResponse = try await classGroupService.joinClassGroup(joinDetails: joinDetails)
			switch joinResponse.success {
			case true:
				print(joinResponse.message)
				do {
					let descriptor = FetchDescriptor<ClassGroup>(predicate: #Predicate { $0.id == joinResponse.classGroupId })
					let classToJoin = try modelContext.fetch(descriptor)
					if let joinedGroups = classToJoin.first {
						let classStudent = ClassStudents(
							id: UUID(),
							parentId: parentId,
							teacherId: joinResponse.teacherId,
							studentName: studentName,
							classCode: joinedGroups.classCode,
							classLevel: joinedGroups.classLevel,
							classGroup: joinedGroups,
						)
						
						
					} else {
						print("Group not found in local storage.")
					}
				} catch {
					print("Error updating Students ClassGroup")
				}
			case false:
				print(joinResponse.message)
			}
		} catch {
			print("Error: \(error)")
		}
	}
}


