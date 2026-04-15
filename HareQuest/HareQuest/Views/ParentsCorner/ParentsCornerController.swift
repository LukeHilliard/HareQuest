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
	@Published var parentsChildren: [ParentChild]?
	@Published var hasChildren = false
	
	/// AddChild Elements
	enum ChildClass: String, Codable, CaseIterable, Hashable {
		case first = "1st"
		case second = "2nd"
		case third = "3rd"
		case fourth = "4th"
		case fifth = "5th"
		case sixth = "6th"
	}
	@Published var childName: String = ""
	@Published var childClass: ChildClass = .first
	
	
	func openAddChildView() { currentRoute = .addChild }

}


