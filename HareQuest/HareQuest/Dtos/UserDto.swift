//
//  UserDto.swift
//  HareQuest
//
//  Created by Luke Hilliard on 20/03/2026.
//

import Foundation


struct UserDto: Codable {
	var id: UUID
	var name: String
	var email: String
	var role: String
		/// Using CodingKeys as the json objects are not the same format as Swift objects, followed here: https://stackoverflow.com/questions/69804293/when-to-use-codingkeys-in-decodable
		enum CodingKeys: String, CodingKey {
			case id = "Id"
			case name = "Name"
			case email = "Email"
			case role = "Role"
	}
}
