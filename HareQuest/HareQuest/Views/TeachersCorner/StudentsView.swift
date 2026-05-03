//
//  TeachersCornerView.swift
//  HareQuest
//
//  Created by Luke Hilliard on 01/05/2026.
//

import SwiftUI
import SwiftData

struct StudentsView: View {
	@Environment(\.modelContext) private var modelContext
	@StateObject private var controller = TeachersCornerController()
	let classGroup: ClassGroup
/// Querying with a filter - https://developer.apple.com/documentation/swiftdata/filtering-and-sorting-persistent-data
//	@Query private var students: [ClassGroup]
//	init(teacherId: UUID) {
//		self.teacherId = teacherId
//		_classGroups = Query(filter: #Predicate<ClassGroup> { groups in
//				groups.teacherId == teacherId
//		}, sort: \.classLevel)
//	}
	@Query(sort: \Student.name, order: .forward) var students: [Student]

		var body: some View {
				VStack{
				NavigationStack {
						VStack {
								VStack(alignment: .leading){
								Text("Filter Students' Activities ")
												.font(.system(size: 28, weight: .bold, design: .rounded))
								HStack{
										Button("To grade"){}
												.buttonStyle(FilterButtonStyle(status: .tertiaryButton))
										Button("Incomplete"){}
												.buttonStyle(FilterButtonStyle(status: .secondaryButton))
										Button("Graded"){}
												.buttonStyle(FilterButtonStyle(status: .mainButton))
								}
											
								HStack {
										Text("All Students ") //Change so it shows filter
												.font(.system(size: 28, weight: .bold, design: .rounded))
										
										if students.isEmpty == false {
												Text("No students in this class")
										}
								}}
								
								if students.isEmpty == false {
										List {
												ForEach(students) { student in
														ZStack {
															StudentCard(studentName: student.name, studentLastName: "", status: "", statusColor: .gray)
														}
														.frame(width: 350, height: 100)
														.listRowSeparator(.hidden)
														.listRowBackground(Color.clear)
														
														/// List item gestures, swipe right to edit, swipe left to delete
														.swipeActions(edge: .trailing) {
																Button(role: .destructive) {
																		modelContext.delete(student)
																}
														}
												}
										}
										.listStyle(.plain)
										
								} else {
									Spacer()
									Text("No Student's have registered for this class").font(.system(size: 20, weight: .semibold, design: .rounded)).padding(.vertical)
									Spacer()
								}
								Spacer()
						}
				}.navigationBarBackButtonHidden(true)
				.padding()
			}.ignoresSafeArea(.all)
		}
}

#Preview {
	TeachersCornerView(teacherId: UUID())
}
