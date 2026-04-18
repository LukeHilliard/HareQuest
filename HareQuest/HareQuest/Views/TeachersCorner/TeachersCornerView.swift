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
	@Query(sort: \ClassGroup.classLevel, order: .forward) var classGroups: [ClassGroup]
	
    var body: some View {
			Header(title: "Teacher's Corner", backgroundColor: Color.brown)
			NavigationStack {
				VStack {
					HStack {
						Text("Students")
							.font(.title)
						
						if classGroups.isEmpty == false {
							NavigationLink(destination: AddClassView(controller: controller)) {
								Image(systemName: "plus.circle")
							}
						}
					}
					
					/// Horizontal line
					Capsule()
						.fill(Color.black)
						.frame(height: 2)
						.padding(.horizontal)
					

					if classGroups.isEmpty == false {
						List {
							ForEach(classGroups) { classGroup in
								ZStack {
									RoundedRectangle(cornerRadius: 15)
										.stroke(Color.gray.opacity(0.5), lineWidth: 1)
										.background(Color.white.cornerRadius(15))

									Text(classGroup.className).bold()
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
//								.swipeActions(edge: .leading, allowsFullSwipe: true) {
//									NavigationLink(destination: EditChildView(controller: controller, classGroup: classGroup)) {
//										Label("Edit", systemImage: "pencil")
//									}
//									.tint(.blue)
//								}
								
							}
						}
						.listStyle(.plain)
						
					} else {
						
						Text("Create a class")
						NavigationLink(destination: AddClassView(controller: controller)) {
							Text("Create")
						}
						
					}
					Spacer()
				}
			}
    }
}

#Preview {
    TeachersCornerView()
}
