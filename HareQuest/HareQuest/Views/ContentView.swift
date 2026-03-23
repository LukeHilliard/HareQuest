//
//  ContentView.swift
//  HareQuest
//
//  Created by Luke Hilliard on 09/03/2026.
//

import SwiftUI
import SwiftData

struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext

    var body: some View {
       LandingView()
    }
}

#Preview {
    ContentView()
// TODO: Add tables
//        .modelContainer(for: Item.self, inMemory: true)
}
