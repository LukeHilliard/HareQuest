//
//  RegisterDto.swift
//  HareQuest
//
//  Created by Luke Hilliard on 23/03/2026.
//

import Foundation


struct RegisterDto: Codable {
	let name: String
	let email: String
	let password: String
	let role: String
}

struct RegisterResponseDto: Codable {
	let message: String?
	let userId: UUID?
	let success: Bool?
}
