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
	}
	@Published var selectedTab: HomeTabs = .activities
	
	let keychain = KeychainSwift()
	let sessionManager = SessionManager.shared
	
}
