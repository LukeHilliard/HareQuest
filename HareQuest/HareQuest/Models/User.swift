//
//  User.swift
//  HareQuest
//
//  Created by Luke Hilliard on 23/03/2026.
//

import Foundation
struct User: Codable {
	let id: UUID
	let name: String
	let email: String
	let password: String
	let role: String
}
