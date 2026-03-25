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
	
	@Published var acessToken: String? = nil
	let keychain = KeychainSwift()
	
	init() {
		acessToken = keychain.get("hq_token")
	}
	
}
