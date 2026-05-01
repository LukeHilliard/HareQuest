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
					ForEach(ParentsCornerController.ChildClass.allCases, id: \.self) { role in
								Text(role.rawValue)
						}
				}.buttonStyle(.bordered)
                Text("Class").font(.system(size: 28, weight: .semibold, design: .rounded)).padding(.vertical)
			}
			HStack {
				Button("Cancel") {
					dismiss()
				}.buttonStyle(ReturnButtonStyle())
				Button("Add Child") {
					modelContext.insert(Student(id: UUID(), name: controller.childName, classGroup: controller.childClass))
				}.buttonStyle(CreateButtonStyle())
			}
			Spacer()
        }.padding()
		.navigationBarBackButtonHidden(true)
	}
}

#Preview {
    AddChildView(controller: ParentsCornerController())
}
