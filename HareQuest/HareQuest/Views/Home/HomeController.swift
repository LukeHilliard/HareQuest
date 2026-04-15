//
//  HomeController.swift
//  HareQuest
//
//  Created by Luke Hilliard on 23/03/2026.
//

import Foundation
import SwiftUI
import Combine
import KeychainSwift

class HomeController: ObservableObject {

	/// Tab state
	enum HomeTabs: Int {
		case parentsCorner = 0
		case activities = 1
		case profile = 2
		case teachersCorner = 3
	}
	
	private let keychain = KeychainSwift()
	
	@Published var selectedTab: HomeTabs = .activities
	@Published var sessionManager = SessionManager.shared
	@Published var role: String? = nil
	
	init() {
		self.role = self.keychain.get("hq_role")
	}
	
	
	
}
