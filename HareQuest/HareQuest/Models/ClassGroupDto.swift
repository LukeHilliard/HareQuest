//
//  ClassGroupDto.swift
//  HareQuest
//
//  Created by Luke Hilliard on 16/04/2026.
//

import Foundation


struct ClassGroupDto: Codable {
	let teacherId: UUID
	let name: String
	let classLevel: String
}

struct ClassStudent: Codable {
	let id: UUID
	let parentId: UUID
	let studentName: String
}

struct ClassGroupResponse: Codable {
	let id: UUID
	let status: Int
	let message: String
	let success: Bool
	let teacherId: UUID
	let name: String
	let classCode: String
	let classLevel: String
	let students: [ClassStudent]?
}

