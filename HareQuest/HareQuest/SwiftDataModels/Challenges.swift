//
//  Challenges.swift
//  HareQuest
//
//  Created by Luke Hilliard on 04/05/2026.
//

import Foundation
import SwiftData
import Combine

@Model
final class Challenges {
	@Attribute(.unique) var id: UUID
	var classGroupId: UUID
	var name: String
	var reward: Int
	

	
	init(id: UUID, classGroupId: UUID, name: String, reward: Int) {
		self.id = id
		self.classGroupId = classGroupId
		self.name = name
		self.reward = reward
	}
}
