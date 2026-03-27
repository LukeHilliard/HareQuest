//
//  ParentChild.swift
//  HareQuest
//
//  Created by Luke Hilliard on 26/03/2026.
//

import Foundation
import SwiftData

@Model
class ParentChild {
	var id: UUID
	var name: String
	var classGroup: String

	var parent: User?
	
	
	init(id: UUID, name: String, classGroup: String) {
		self.id = id
		self.name = name
		self.classGroup = classGroup
	}
}
