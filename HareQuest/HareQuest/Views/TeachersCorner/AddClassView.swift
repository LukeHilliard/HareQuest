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
	@State private var classCode = "No Code"
	@State private var newClassId: UUID?
	
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
					Text("Class")
					Picker("Grade", selection: $controller.classLevel) {
						ForEach(TeachersCornerController.ClassLevel.allCases, id: \.self) { role in
							Text(role.rawValue)
							}
					}.buttonStyle(.bordered)
				}
				HStack {
					Button("Return") {
						dismiss()
					}.buttonStyle(.bordered)
					Button("Create Class Group") {
						Task {
							do {
								let createdClass = try await controller.createClassGroup()
								modelContext.insert(ClassGroup(
									id: createdClass.id,
									teacherId: createdClass.teacherId,
									className: createdClass.className,
									classCode: createdClass.classCode,
									classLevel: createdClass.classLevel,
									students: []
								))
								codeIsGenerated = true
								
							} catch {
								print("ERROR: \(error)")
							}
							
						}
					}.buttonStyle(.bordered)
				}
				
			} else {
				Text("Class Group successfully created.")
				Text("Code generated! Share with students")
				Text(classCode)
				Button("Continue") {
					dismiss()
				}
			}
			Spacer()
			
		}
		.navigationBarBackButtonHidden(true)
	}
}

#Preview {
		AddClassView(controller: TeachersCornerController())
}
