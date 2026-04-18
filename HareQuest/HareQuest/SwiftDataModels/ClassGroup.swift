//
//  ClassGroup.swift
//  HareQuest
//
//  Created by Luke Hilliard on 15/04/2026.
//

import Foundation
import SwiftData
import Combine

@Model
final class ClassGroup {
	@Attribute(.unique) var id: UUID
	var teacherId: UUID
	var className: String
	var classCode: String
	var classLevel: String
	
	var students: [Student]?
	

	
	init(id: UUID, teacherId: UUID, className: String, classCode: String, classLevel: String, students: [Student]?) {
		self.id = id
		self.teacherId = teacherId
		self.className = className
		self.classCode = classCode
		self.classLevel = classLevel
		self.students = students
	}
}
