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


final class TeachersCornerController: ObservableObject {
	/// Routes
	enum TCornerRoute: Hashable {
		case createClass
	}
	@Published var currentRoute: TCornerRoute?
	
	/// UI Elements
	
	
	/// AddChild Elements
	enum ClassGroup: String, Codable, CaseIterable, Hashable {
		case first = "1st"
		case second = "2nd"
		case third = "3rd"
		case fourth = "4th"
		case fifth = "5th"
		case sixth = "6th"
	}
	@Published var className: String = ""
	@Published var classGroup: ClassGroup = .first
	
	
	
	func openAddClassView() { currentRoute = .createClass }
}

