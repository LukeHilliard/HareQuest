//
//  RegisterController.swift
//  HareQuest
//
//  Created by Luke Hilliard on 23/03/2026.
//

import Foundation
import SwiftUI
import Combine

class RegisterController: ObservableObject {
	enum Role: String, Hashable, CaseIterable {
		case parent = "Parent" /// default
		case teacher = "Teacher"
		case student = "Student"
	}
	
	@Published var name: String = ""
	@Published var email: String = ""
	@Published var password: String = ""
	@Published var role: Role = .parent
	@Published var showLanding: Bool = false
	
	
	func registerNewUser() {
		
	}
	
	func openLandingView() {
		showLanding = true
	}
}
