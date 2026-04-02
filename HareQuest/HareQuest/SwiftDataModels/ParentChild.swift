//
//  ParentChild.swift
//  HareQuest
//
//  Created by Luke Hilliard on 26/03/2026.
//

import Foundation
import SwiftData
import Combine

@Model
class ParentChild: ObservableObject {
	var id: UUID
	var name: String
	var classGroup: ParentsCornerController.ChildClass

	var parent: User?
	
	
	init(id: UUID, name: String, classGroup: ParentsCornerController.ChildClass) {
		self.id = id
		self.name = name
		self.classGroup = classGroup
	}
}
