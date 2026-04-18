//
//  AddChildView.swift
//  HareQuest
//
//  Created by Luke Hilliard on 01/04/2026.
//

import SwiftUI
import SwiftData

struct AddChildView: View {
	@ObservedObject var controller: ParentsCornerController
	@Environment(\.dismiss) var dismiss /// Access NavigationStack built in function 'dismiss'
	@Environment(\.modelContext) private var modelContext
	var body: some View {
		VStack(spacing: 16) {
			HStack {
				Text("My childs name is")
				TextField("Name", text: $controller.childName)
						.textFieldStyle(.roundedBorder)
						.keyboardType(.default)
						.textInputAutocapitalization(.never)
			}
			HStack {
				Text("They are in")
				Picker("Role", selection: $controller.childClass) {
					ForEach(ParentsCornerController.ChildClass.allCases, id: \.self) { role in
								Text(role.rawValue)
						}
				}.buttonStyle(.bordered)
				Text("Class")
			}
			HStack {
				Button("Return") {
					dismiss()
				}.buttonStyle(.bordered)
				Button("Add Child") {
					modelContext.insert(Student(id: UUID(), name: controller.childName, classGroup: controller.childClass))
				}.buttonStyle(.bordered)
			}
			Spacer()
		}
		.navigationBarBackButtonHidden(true)
	}
}

#Preview {
    AddChildView(controller: ParentsCornerController())
}
