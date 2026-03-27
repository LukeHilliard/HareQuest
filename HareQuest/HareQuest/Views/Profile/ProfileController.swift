//
//  ProfileController.swift
//  HareQuest
//
//  Created by Luke Hilliard on 27/03/2026.
//

//
//  LoginController.swift
//  HareQuest
//
//  Created by Luke Hilliard on 23/03/2026.
//

import Foundation
import SwiftUI
import Combine
import KeychainSwift


@MainActor
class ProfileController: ObservableObject {
	/// Routes
	enum ProfileRoute: Hashable {
		case todo
		case home

	}
	@Published var currentRoute: ProfileRoute?
	
	/// UI Elements

	/// Services
	let sessionManager = SessionManager.shared
	
	func openHomeView() { currentRoute = .home }
	
	func logout() {	sessionManager.clear() }

	
}
