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
	@Query(sort: \Student.name, order: .forward) var children: [Student]

	var body: some View {
        VStack {
            Button("Parent's Corner"){}
                .buttonStyle(HeaderStyle())
            
            NavigationStack {
                VStack {
                    HStack {
                        Text("My Kids")
                            .font(.system(size: 36, weight: .heavy, design: .none))
                        
                        
                    }
                    
                    
                    /// Horizontal line
                    Capsule()
                        .fill(Color.black.opacity(0.8))
                        .frame(height: 1)
                        .padding(.horizontal)

                    if children.isEmpty == false {
                        NavigationLink(destination: AddChildView(controller: controller)) {
                            Text("Add Child")
                            Image(systemName: "plus")
                        }.buttonStyle(DefaultButtonStyle())
                    }
                    VStack{
                        //This  goes in the for each loop
                        KidCard(
                            
                            studentName: "Maya",
                            studentLastName: "O'connor",
                            year: "Year 1-2",
                            gradedBy: "Victoria McNeil",
                            grade: 9,
                            comments: "Maya achieves average results and can produce solid work when focused, but their behaviour is ..."
                        ).padding(.bottom)
                        
                        KidCard(
                            
                            studentName: "Oisin",
                            studentLastName: "O'connor",
                            year: "Year 1-2",
                            gradedBy: "Victoria McNeil",
                            grade: 9,
                            comments: "Maya achieves average results and can produce solid work when focused, but their behaviour is ..."
                        )
                    }.padding()
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
                        
                        Text("No children found")
                        NavigationLink(destination: AddChildView(controller: controller)) {
                            Text("Add Child")
                            Image(systemName: "plus")
                        }.buttonStyle(DefaultButtonStyle())
                        
                    }
                    Spacer()
                }.padding(.vertical)
                
            }.padding(.vertical)
                .navigationBarHidden(true)
               
        } .ignoresSafeArea(.all)

	}
	
}

#Preview {
    ParentsCornerView()
}
