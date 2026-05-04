//
//  TeachersCornerView.swift
//  HareQuest
//
//  Created by Luke Hilliard on 13/04/2026.
//

import SwiftUI
import SwiftData

struct TeachersCornerView: View {
	@Environment(\.modelContext) private var modelContext
	@StateObject private var controller = TeachersCornerController()
	let teacherId: UUID
/// Querying with a filter - https://developer.apple.com/documentation/swiftdata/filtering-and-sorting-persistent-data
	@Query private var classGroups: [ClassGroup]
	init(teacherId: UUID) {
		self.teacherId = teacherId
		_classGroups = Query(filter: #Predicate<ClassGroup> { groups in
				groups.teacherId == teacherId
		}, sort: \.classCode)
	}

    var body: some View {
			Header(title: "Teacher's Corner", backgroundColor: .secondaryButton)
			
        NavigationStack {
					HStack {
						Text("Class Groups ")
										.font(.system(size: 28, weight: .bold, design: .rounded))
						if classGroups.isEmpty == false {
								NavigationLink(destination: AddClassView(controller: controller)) {
										Text("Add Class")
										Image(systemName: "plus")
								}.buttonStyle(PlainButtonStyle())
						}
					}
					
					VStack {
							if classGroups.isEmpty == false {
									List {
											ForEach(classGroups) { classGroup in
												NavigationLink(destination: StudentsView(classGroup: classGroup)) {
													ZStack {
														ClassCard(className: classGroup.name, classLevel: classGroup.classLevel.rawValue, classCode: classGroup.classCode, statusColor: Color.accentColor)
													}
													.frame(width: 350, height: 100)
													.listRowSeparator(.hidden)
													.listRowBackground(Color.clear)
													
													/// List item gestures, swipe right to edit, swipe left to delete
													.swipeActions(edge: .trailing) {
															Button(role: .destructive) {
																	modelContext.delete(classGroup)
															}
													}
												}
													
//														.swipeActions(edge: .leading, allowsFullSwipe: true) {
//															NavigationLink(destination: EditChildView(controller: controller, classGroup: classGroup)) {
//																Label("Edit", systemImage: "pencil")
//															}
//															.tint(.blue)
//														}
													
											}.listRowSeparator(.hidden)
									}
									
									.listStyle(.plain)
									
							} else {
									Spacer()
									Text("No Class found").font(.system(size: 20, weight: .semibold, design: .rounded)).padding(.vertical)
									NavigationLink(destination: AddClassView(controller: controller)){
									Text("Create Class")
											Image(systemName: "plus")
							}.buttonStyle(DefaultButtonStyle())
								 Spacer()
							}
							Spacer()
					}
					.id(teacherId)
			}.navigationBarBackButtonHidden(true)
	}
}

#Preview {
	TeachersCornerView(teacherId: UUID())
}
