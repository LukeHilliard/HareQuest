//
//  ContentView.swift
//  HareQuest
//
//  Created by Luke Hilliard on 09/03/2026.
//

import SwiftUI
import SwiftData

struct ContentView: View {
	@StateObject private var session = SessionManager.shared
//    @Environment(\.modelContext) private var modelContext

    var body: some View {
			Group {
				if session.isAuth {
					HomeView()
				} else {
					LandingView()
				}
			}
			.animation(.easeInOut, value: session.isAuth)
    }
}

#Preview {
    ContentView()
// TODO: Add tables
//        .modelContainer(for: Item.self, inMemory: true)
}
