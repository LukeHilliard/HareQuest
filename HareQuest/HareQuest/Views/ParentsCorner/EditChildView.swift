//
//  EditChildView.swift
//  HareQuest
//
//  Created by Luke Hilliard on 02/04/2026.
//

import SwiftUI
import SwiftData

struct EditChildView: View {
	@ObservedObject var controller: ParentsCornerController
	@Environment(\.dismiss) var dismiss /// Access NavigationStack built in function 'dismiss'
	@Environment(\.modelContext) private var modelContext
	
	@StateObject var child: ParentChild
	
	
	var body: some View {
		VStack(spacing: 16) {
			HStack {
				Text("My childs name is")
				TextField("Name", text: $child.name)
						.textFieldStyle(.roundedBorder)
						.keyboardType(.default)
						.textInputAutocapitalization(.never)
			}
			HStack {
				Text("They are in")
				Picker("Role", selection: $child.classGroup) {
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
				Button("Update Child") {
//					modelContext.insert(ParentChild(id: UUID(), name: controller.childName, classGroup: controller.childClass))
				}.buttonStyle(.bordered)
			}
			Spacer()
		}
		.navigationBarBackButtonHidden(true)
	}
}

#Preview {
    EditChildView(
        controller: ParentsCornerController(),
        child: ParentChild(id: UUID(), name: "Test", classGroup: .first)
    )
}
