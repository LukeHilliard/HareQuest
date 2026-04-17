//
//  AddClassView.swift
//  HareQuest
//
//  Created by Luke Hilliard on 15/04/2026.
//

import SwiftUI
import SwiftData
struct AddClassView: View {
	@ObservedObject var controller: TeachersCornerController
	@Environment(\.dismiss) var dismiss /// Access NavigationStack built in function 'dismiss'
	@Environment(\.modelContext) private var modelContext
	
	@State private var codeIsGenerated = false
	
	var body: some View {
		VStack(spacing: 16) {
			
			if !codeIsGenerated {
				HStack {
					Text("Class Name")
					TextField("Name", text: $controller.className)
							.textFieldStyle(.roundedBorder)
							.keyboardType(.default)
							.textInputAutocapitalization(.never)
				}
				HStack {
					Text("Class Group")
					Picker("Class Group", selection: $controller.classGroup) {
						ForEach(TeachersCornerController.ClassGroup.allCases, id: \.self) { role in
							Text(role.rawValue)
							}
					}.buttonStyle(.bordered)
				}
				HStack {
					Button("Return") {
						dismiss()
					}.buttonStyle(.bordered)
					Button("Create Class") {
						Task {
							do {
								try await controller.createClassGroup()
							} catch {
								print("ERROR: \(error)")
							}
							
						}
					}.buttonStyle(.bordered)
				}
				Spacer()
			} else {
				Text("Code generated")
				Button("Continue") {
					dismiss()
				}
			}
			
		}
		.navigationBarBackButtonHidden(true)
	}
}

#Preview {
		AddClassView(controller: TeachersCornerController())
}
