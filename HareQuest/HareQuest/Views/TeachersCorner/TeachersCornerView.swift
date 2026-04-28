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
		}, sort: \.classLevel)
	}

    var body: some View {
        VStack{
        Button("Teacher's Corner"){}
            .buttonStyle(HeaderStyle(color: .secondaryButton))
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
                    
                    if classGroups.isEmpty == false {
                        NavigationLink(destination: AddClassView(controller: controller)) {
                            Text("Add Student")
                        }.buttonStyle(DefaultButtonStyle())
                    }
                }}
                
                //Go in for each loop
                StudentCard(
                    studentName: "Maya",
                      studentLastName: "O'connor",
                   status: "To Grade",
                    statusColor: .tertiaryButton
                    )
                StudentCard(
                    studentName: "Maya",
                      studentLastName: "O'connor",
                   status: "Graded",
                    statusColor: .mainButton
                    )
                StudentCard(
                    studentName: "Maya",
                      studentLastName: "O'connor",
                   status: "Incomplete",
                    statusColor: .secondaryButton
                    )
                
                if classGroups.isEmpty == false {
                    List {
                        ForEach(classGroups) { classGroup in
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                    .background(Color.white.cornerRadius(15))
                                
                                Text(classGroup.name)
                                    .font(.headline)
                                    .foregroundColor(.primary)
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
                    Spacer()
                    Text("No students found").font(.system(size: 20, weight: .semibold, design: .rounded)).padding(.vertical)
                    NavigationLink(destination: AddClassView(controller: controller)){
                    Text("Add Student")
                }.buttonStyle(DefaultButtonStyle())
                   Spacer()
                }
                Spacer()
            }
            .id(teacherId)
        }.padding()
        }.ignoresSafeArea(.all)
    }
}

#Preview {
	TeachersCornerView(teacherId: UUID())
}
