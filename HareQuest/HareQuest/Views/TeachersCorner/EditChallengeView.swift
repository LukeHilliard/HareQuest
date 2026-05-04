//
//  EditChallengeView.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 01/05/2026.
//

import SwiftUI
import SwiftData

struct EditChallengeView: View {
    @ObservedObject var controller: ParentsCornerController
    @Environment(\.dismiss) var dismiss /// Access NavigationStack built in function 'dismiss'
    @Environment(\.modelContext) private var modelContext
    
    @State var child: Student
    
    
    var body: some View {
        VStack(spacing: 16) {
            VStack {
                Text("Challenge")
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
                Text("Coins Worth").font(.system(size: 28, weight: .semibold, design: .rounded))
                TextField("Name", text: $child.name)
                    .font(.title3)
                    .fontWeight(.regular)
                    .padding()
                    .frame(maxWidth: 90)
                    .background(Color.white)
                    .cornerRadius(50)
                    .shadow(color: Color.secondaryTitle.opacity(0.25), radius: 0, x:0, y:7)
                    .shadow(color: Color.secondaryTitle.opacity(0.08), radius: 10, x:0, y:-7)
                
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
    EditChallengeView(
        controller: ParentsCornerController(),
				child: Student(id: UUID(), name: "100", classLevel: .first, hasClass: false)
    )
}
