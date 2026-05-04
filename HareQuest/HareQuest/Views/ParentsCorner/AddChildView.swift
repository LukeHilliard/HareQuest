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
	@State private var childCreated: Bool = false
	@State private var joinedClass: Bool = false
	var body: some View {
		VStack(spacing: 16) {
			if childCreated == false {
				HStack {
					
					TextField("My child's name is", text: $controller.childName)
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
					Text("They are in").font(.system(size: 28, weight: .semibold, design: .rounded))
					Picker("Role", selection: $controller.childClass) {
						ForEach(ChildClass.allCases, id: \.self) { role in
							Text(role.rawValue)
						}
					}.buttonStyle(.bordered)
					Text("Class").font(.system(size: 28, weight: .semibold, design: .rounded)).padding(.vertical)
				}
				HStack {
					Button("Return") {
						dismiss()
					}.buttonStyle(ReturnButtonStyle())
					Button("Add Child") {
						modelContext.insert(Student(id: UUID(), name: controller.childName, classLevel: controller.childClass, hasClass: false))
						childCreated = true
					}.buttonStyle(CreateButtonStyle())
					
				}
			} else {
				Text("Enter code provided by their teacher.").font(.system(size: 28, weight: .semibold, design: .rounded))
				HStack {
					
					TextField("Class Code", text: $controller.childClassCode)
						.font(.title3)
						.fontWeight(.bold)
						.padding()
						.frame(maxWidth: .infinity)
						.background(Color.white)
						.cornerRadius(50)
						.shadow(color: Color.secondaryTitle.opacity(0.25), radius: 0, x:0, y:7)
						.shadow(color: Color.secondaryTitle.opacity(0.08), radius: 10, x:0, y:-7)
						.keyboardType(.numberPad)
					
				}
				HStack {
					Button("Return") {
						dismiss()
					}.buttonStyle(ReturnButtonStyle())
					Button("Join Class") {
						Task {
							try await controller.joinClass(studentName: controller.childName, modelContext: modelContext)
							joinedClass = true
						}
						
						//						modelContext.insert(Student(id: UUID(), name: controller.childName, classLevel: controller.childClass, hasClass: false))
						
					}.buttonStyle(CreateButtonStyle())
				}
				
				Spacer()
				
					
			}
			Spacer()
		}.navigationBarBackButtonHidden(true)
	}
}

#Preview {
    AddChildView(controller: ParentsCornerController())
}
