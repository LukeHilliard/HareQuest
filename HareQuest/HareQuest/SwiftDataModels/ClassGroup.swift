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
	var name: String
	var classCode: String
	var classLevel: ChildClass
	
	var students: [Student]?
	

	
	init(id: UUID, teacherId: UUID, name: String, classCode: String, classLevel: ChildClass, students: [Student]?) {
		self.id = id
		self.teacherId = teacherId
		self.name = name
		self.classCode = classCode
		self.classLevel = classLevel
		self.students = students
	}
}

