//
//  LoginDto.swift
//  HareQuest
//
//  Created by Luke Hilliard on 25/03/2026.
//
import Foundation


struct LoginDto: Codable {
	let email: String
	let password: String
}

struct LoginResponseDto: Codable {
	let message: String?
	let userId: UUID?
	let success: Bool?
	let accessToken: String?
}
