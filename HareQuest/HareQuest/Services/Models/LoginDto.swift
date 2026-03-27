//
//  LoginDto.swift
//  HareQuest
//
//  Created by Luke Hilliard on 26/03/2026.
//

import Foundation




struct LoginDto: Codable {
	let email: String
	let password: String
}
struct LoginResponseDto: Codable {
	let status: Int
	let success: Bool
	let message: String
	let accessToken: String?
	let userId: UUID?
}
