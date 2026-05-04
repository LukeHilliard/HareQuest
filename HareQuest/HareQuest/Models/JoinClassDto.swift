//
//  JoinClassDto.swift
//  HareQuest
//
//  Created by Luke Hilliard on 18/04/2026.
//

import Foundation


struct JoinClassDto: Codable {
	let classCode: String
	let classLevel: ChildClass
	let parentId: UUID
	let studentName: String
}

struct JoinClassResponse: Codable {
	let message: String
	let success: Bool
	let status: Int
	let classGroupId: UUID
	let teacherId: UUID
}
