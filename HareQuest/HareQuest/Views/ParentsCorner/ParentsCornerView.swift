//
//  ParentsCornerView.swift
//  HareQuest
//
//  Created by Luke Hilliard on 26/03/2026.
//

import SwiftUI
import SwiftData

struct ParentsCornerView: View {
	@StateObject private var controller = ParentsCornerController()
	@Environment(\.modelContext) private var modelContext
	@Query(sort: \ParentChild.name, order: .forward) var children: [ParentChild]

	var body: some View {
		Header(title: "Parents Corner", backgroundColor: Color.blue)
		NavigationStack {
			VStack {
				HStack {
					Text("My Kids")
						.font(.title)
					
					if children.isEmpty == false {
						NavigationLink(destination: AddChildView(controller: controller)) {
							Image(systemName: "plus.circle")
						}
					}
				}
				
				
				/// Horizontal line
				Capsule()
					.fill(Color.black)
					.frame(height: 2)
					.padding(.horizontal)

				if children.isEmpty == false {
					List {
						ForEach(children) { child in
							ZStack {
								RoundedRectangle(cornerRadius: 15)
										.stroke(Color.gray.opacity(0.5), lineWidth: 1)
										.background(Color.white.cornerRadius(15))
								
								Text(child.name).bold()
	
							}
							.frame(width: 350, height: 100)
									.listRowSeparator(.hidden)
							.listRowBackground(Color.clear)
							/// List item gestures, swipe right to edit, swipe left to delete
							.swipeActions(edge: .trailing) {
								Button(role: .destructive) {
										modelContext.delete(child)
								} label: {
										Label("Delete", systemImage: "trash")
								}
							}
							.swipeActions(edge: .leading, allowsFullSwipe: true) {
								NavigationLink(destination: EditChildView(controller: controller, child: child)) {
										Label("Edit", systemImage: "pencil")
								}
								.tint(.blue)
							}
						}
					}
					.listStyle(.plain)
					
				} else {
					
					Text("Need to add children")
					NavigationLink(destination: AddChildView(controller: controller)) {
						Text("Add Child")
					}
					
				}
				Spacer()
			}
			
		}
	}
	
}

#Preview {
    ParentsCornerView()
}
