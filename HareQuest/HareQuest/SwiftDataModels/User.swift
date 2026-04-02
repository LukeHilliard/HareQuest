//
//  User.swift
//  HareQuest
//
//  Created by Luke Hilliard on 23/03/2026.
//
import Foundation
import SwiftData



@Model
final class User {
	var id: UUID
	var name: String
	var email: String
	var role: String
	
	
	/// This relationship only applies to users who's role = 'parent' | One User to Many ParentChild
	@Relationship(deleteRule: .cascade, inverse: \ParentChild.parent)
	var parentChildren: [ParentChild] = []
	
	init(id: UUID, name: String, email: String, role: String) {
		self.id = id
		self.name = name
		self.email = email
		self.role = role
	}
}
