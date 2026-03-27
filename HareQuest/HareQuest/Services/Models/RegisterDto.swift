//
//  RegisterDto.swift
//  HareQuest
//
//  Created by Luke Hilliard on 26/03/2026.
//

import Foundation

struct RegisterDto: Codable {
	let name: String
	let email: String
	let password: String
	let role: String
}


struct RegisterResponseDto: Codable {
	let status: Int
	let success: Bool
	let message: String
}



enum Role: String, Codable, CaseIterable {
	case parent = "Parent" /// default
	case teacher = "Teacher"
	case student = "Student"
}
