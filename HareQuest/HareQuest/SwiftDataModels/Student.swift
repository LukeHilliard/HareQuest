//
//  Student.swift
//  HareQuest
//
//  Created by Luke Hilliard on 26/03/2026.
//

import Foundation
import SwiftData
import Combine

@Model
final class Student {
	var id: UUID
	var name: String
	var classLevel: ChildClass
	var hasClass: Bool

	var parent: User?
	var classGroup: ClassGroup?
	
	
	init(id: UUID, name: String, classLevel: ChildClass, hasClass: Bool) {
		self.id = id
		self.name = name
		self.classLevel = classLevel
		self.hasClass = hasClass
	}
}

enum ChildClass: String, Codable, CaseIterable, Hashable {
	case first = "1st"
	case second = "2nd"
	case third = "3rd"
	case fourth = "4th"
	case fifth = "5th"
	case sixth = "6th"
}
