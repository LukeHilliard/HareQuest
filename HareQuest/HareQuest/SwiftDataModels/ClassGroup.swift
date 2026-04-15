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
	var name: String
	var classGroup: String
	var classCode: String

	
	init(id: UUID, teacherId: UUID, name: String, classGroup: String, classCode: String) {
		self.id = id
		self.teacherId = teacherId
		self.name = name
		self.classGroup = classGroup
		self.classCode = classCode
	}
}
