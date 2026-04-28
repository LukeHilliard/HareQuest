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
				
					TextField("Class Name", text: $controller.name)
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(50)
                        .shadow(color: Color.secondaryTitle.opacity(0.25), radius: 0, x:0, y:7)
                        .shadow(color: Color.secondaryTitle.opacity(0.08), radius: 10, x:0, y:-7)
                       
				}
				HStack {
                    Text("Class")
                        .font(.system(size: 28, weight: .semibold, design: .rounded))
                    
					Picker("Grade", selection: $controller.classLevel) {
						ForEach(TeachersCornerController.ClassLevel.allCases, id: \.self) { role in
							Text(role.rawValue)
							}
					}.buttonStyle(.bordered)
				}
                .padding()
				HStack {
					Button("Cancel") {
						dismiss()
					}.buttonStyle(ReturnButtonStyle())
					Button("Create Class") {
						Task {
							do {
								let createdClass = try await controller.createClassGroup()
								
								await MainActor.run {
									modelContext.insert(ClassGroup(
										id: createdClass.id,
										teacherId: createdClass.teacherId,
										name: createdClass.name,
										classCode: createdClass.classCode,
										classLevel: createdClass.classLevel,
										students: []
									))
									
									codeIsGenerated = true
									self.classCode = createdClass.classCode
								}
							} catch {
								print("ERROR: \(error)")
							}
							
						}
					}.buttonStyle(CreateButtonStyle())
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
			
        }.padding()
		.navigationBarBackButtonHidden(true)
	}
}

#Preview {
		AddClassView(controller: TeachersCornerController())
}
