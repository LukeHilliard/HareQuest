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
class ClassGroup: ObservableObject {
	var id: UUID
	var teacherId: UUID
	var className: String
	var classCode: String
	var classLevel: String
	

	
	init(id: UUID, teacherId: UUID, className: String, classLevel: String, classCode: String) {
		self.id = id
		self.teacherId = teacherId
		self.className = className
		self.classLevel = classLevel
		self.classCode = classCode
	}
}
