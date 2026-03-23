//
//  LoginController.swift
//  HareQuest
//
//  Created by Luke Hilliard on 23/03/2026.
//

import Foundation
import SwiftUI
import Combine
class LoginController: ObservableObject {

	@Published var email: String = ""
	@Published var password: String = ""
	@Published var showLanding: Bool = false
	
	// TODO: Implement user login, UserDefaults, Keychain
	func LoginUser() {
		
	}
	
	func openLandingView() {
		showLanding = true
	}
}
