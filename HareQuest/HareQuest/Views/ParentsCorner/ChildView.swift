//
//  ChildView.swift
//  HareQuest
//
//  Created by Luke Hilliard on 18/04/2026.
//

import SwiftUI
import SwiftData

struct ChildView: View {
	@ObservedObject var controller: ParentsCornerController
	@Environment(\.modelContext) private var modelContext
	let student: Student
    var body: some View {
			HStack {
				Text(student.name)
				Text(student.classLevel.rawValue)
			}
			if student.hasClass {
				Text("ClassGroup Details")
			} else {
				HStack {
					Text("Add Child to Class Group")
					TextField("Class Code", text: $controller.childClassCode)
						.textFieldStyle(.roundedBorder)
						.keyboardType(.numberPad)
						.autocapitalization(.none)
					Button("Join") {
						Task {
							try await controller.joinClass(studentName: student.name, modelContext: modelContext)
						}
					}
				}
			}
			
			Spacer()
			.navigationBarBackButtonHidden(false)
		}
}

#Preview {
	ChildView(controller: ParentsCornerController(), student: .init(id: UUID(), name: "Luke", classLevel: ChildClass.first, hasClass: true))
}
