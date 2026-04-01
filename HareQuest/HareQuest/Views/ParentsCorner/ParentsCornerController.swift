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


@MainActor
class ParentsCornerController: ObservableObject {
	/// Routes
	enum PCornerRoute: Hashable {
		case addChild
	}
	@Published var currentRoute: PCornerRoute?
	
	/// UI Elements
	@Published var parentsChildren: [ParentChild]?
	@Published var hasChildren = false
	
		/// AddChild Elements
	enum ChildClass: String, Codable, CaseIterable {
		case first = "1st"
		case second = "2nd"
		case third = "3rd"
		case fourth = "4th"
		case fifth = "5th"
		case sixth = "6th"
	}
	@Published var childName: String = ""
	@Published var childClass: ChildClass = .first

	/// Services
	
	
	func openAddChildView() { currentRoute = .addChild }
	
	func getParentsChildren() async throws -> Void {
		// TODO: check if data available on device, if not call api
	}
	
	func addChild() async throws -> Void {
		// TODO: Implement ParentChildService
		print("Adding child")
		print("Values-\(childName)---\(childClass)")
	}
	
	init() {
		Task {
			if parentsChildren == nil {
				try await getParentsChildren()
			}
		}
		hasChildren = parentsChildren?.isEmpty == false
		
	}
	
	
	
}


