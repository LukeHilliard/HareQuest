//
//  ChallengesDto.swift
//  HareQuest
//
//  Created by Luke Hilliard on 04/05/2026.
//

import Foundation

struct ChallengesDto: Codable {
	let id: UUID
	let classGroupId: UUID
	let name: String
	let reward: Int
}

struct ChallengesResponseDto: Codable {
	let id: UUID
	let classGroupId: UUID
	let name: String
	let reward: Int
}
