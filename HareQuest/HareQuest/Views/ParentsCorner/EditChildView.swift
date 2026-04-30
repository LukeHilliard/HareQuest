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
	
	@State var child: Student
	
	
	var body: some View {
		VStack(spacing: 16) {
			VStack {
				Text("Name")
                    .font(.system(size: 28, weight: .semibold, design: .rounded))
				TextField("Name", text: $child.name)
                    .font(.title3)
                    .fontWeight(.regular)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(50)
                    .shadow(color: Color.secondaryTitle.opacity(0.25), radius: 0, x:0, y:7)
                    .shadow(color: Color.secondaryTitle.opacity(0.08), radius: 10, x:0, y:-7)
			}
			VStack {
                Text("Class").font(.system(size: 28, weight: .semibold, design: .rounded))
				Picker("Role", selection: $child.classGroup) {
					ForEach(ParentsCornerController.ChildClass.allCases, id: \.self) { role in
								Text(role.rawValue)
						}
				}.buttonStyle(.bordered)
				
			}
			HStack {
				Button("Return") {
					dismiss()
				}.buttonStyle(ReturnButtonStyle())
				Button("Update") {

				}.buttonStyle(CreateButtonStyle())
			}
			Spacer()
		}
        .padding()
		.navigationBarBackButtonHidden(true)
	}
}

#Preview {
    EditChildView(
        controller: ParentsCornerController(),
        child: Student(id: UUID(), name: "Test", classGroup: .first)
    )
}
