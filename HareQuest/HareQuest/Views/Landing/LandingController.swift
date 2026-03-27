//
//  LandingController.swift
//  HareQuest
//
//  Created by Luke Hilliard on 23/03/2026.
//

import Foundation
import SwiftUI
import Combine



@MainActor
final class LandingController: ObservableObject {
	/// Routes
	enum LandingRoute: Hashable {
		case login
		case register
	}
	@Published var currentRoute: LandingRoute?
	
	/// Navigation
	func openLoginView() { currentRoute = .login }
	func openRegisterView() { currentRoute = .register }
	
}
