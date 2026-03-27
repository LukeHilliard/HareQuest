//
//  ParentsCornerController.swift
//  HareQuest
//
//  Created by Luke Hilliard on 26/03/2026.
//

import Foundation
import SwiftUI
import Combine
import KeychainSwift


@MainActor
class ParentsCornerController: ObservableObject {
	/// Routes
	enum PCornerRoute: Hashable {
		case home
	}
	@Published var currentRoute: PCornerRoute?
	
	/// UI Elements
	@Published var parentsChildren: [ParentChild]?

	/// Services
	
	
	func openHomeView() { currentRoute = .home }
	
	
	
}


