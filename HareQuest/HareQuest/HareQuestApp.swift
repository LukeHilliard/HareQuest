//
//  HareQuestApp.swift
//  HareQuest
//
//  Created by Luke Hilliard on 09/03/2026.
//

import SwiftUI
import SwiftData

@main
struct HareQuestApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
					User.self,
					ParentChild.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
