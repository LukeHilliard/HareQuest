//
//  LandingController.swift
//  HareQuest
//
//  Created by Luke Hilliard on 23/03/2026.
//

import Foundation
import SwiftUI
import Combine

final class LandingController: ObservableObject {
	@Published var showLogin: Bool = false
	@Published var showRegister: Bool = false
	
	/// Handles navigation to Login
	func openLoginView() {
		showLogin = true
		showRegister = false
	}
	/// Handles navigation to Register
	func openRegisterView() {
		showRegister = true
		showLogin = false
	}
}
