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
	
	var body: some View {
		VStack(spacing: 16) {
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
					ForEach(ParentsCornerController.ChildClass.allCases, id: \.self) { role in
								Text(role.rawValue)
						}
				}.buttonStyle(.bordered)
			}
			HStack {
				Button("Return") {
					dismiss()
				}.buttonStyle(.bordered)
				Button("Create Class") {
//					modelContext.insert(ParentChild(id: UUID(), name: controller.childName, classGroup: controller.childClass))
				}.buttonStyle(.bordered)
			}
			Spacer()
		}
		.navigationBarBackButtonHidden(true)
	}
}

#Preview {
		AddClassView(controller: TeachersCornerController())
}
