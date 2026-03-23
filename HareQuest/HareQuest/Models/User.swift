//
//  User.swift
//  HareQuest
//
//  Created by Luke Hilliard on 16/03/2026.
//

import Foundation
import SwiftData

@Model
class User {
	var id: UUID
	var name: String
	var email: String
	var role: String
	
	init(id: UUID = UUID(), name: String, email: String, role: String) {
		self.id = id
		self.name = name
		self.email = email
		self.role = role
	}
}

