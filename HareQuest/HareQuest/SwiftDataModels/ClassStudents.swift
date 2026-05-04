//
//  ClassStudents.swift
//  HareQuest
//
//  Created by Luke Hilliard on 04/05/2026.
//

import Foundation
import SwiftData

@Model
final class ClassStudents {
		@Attribute(.unique) var id: UUID
		var parentId: UUID
		var teacherId: UUID
		var classGroup: ClassGroup?
		var studentName: String
		var classCode: String
		var classLevel: ChildClass
	
		init(
				id: UUID = UUID(),
				parentId: UUID,
				teacherId: UUID,
				studentName: String,
				classCode: String,
				classLevel: ChildClass,
				classGroup: ClassGroup? = nil
		) {
				self.id = id
				self.parentId = parentId
				self.teacherId = teacherId
				self.studentName = studentName
				self.classCode = classCode
				self.classLevel = classLevel
				self.classGroup = classGroup
		}
}
