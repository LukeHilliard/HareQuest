//
//  AddChallengeView.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 01/05/2026.
//

import SwiftUI
import SwiftData

struct AddChallengeView: View {
    @ObservedObject var controller: ParentsCornerController
    @Environment(\.dismiss) var dismiss /// Access NavigationStack built in function 'dismiss'
    @Environment(\.modelContext) private var modelContext
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 16) {
                
                TextField("Challenge", text: $controller.childName)
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(50)
                    .shadow(color: Color.secondaryTitle.opacity(0.25), radius: 0, x:0, y:7)
                    .shadow(color: Color.secondaryTitle.opacity(0.08), radius: 10, x:0, y:-7)
                HStack(){
                    Text("Challenge is worth").font(.system(size: 28, weight: .semibold, design: .rounded))
                        
                    Spacer()
                    TextField("Coins", text: $controller.childName)
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: 90)
                        .background(Color.white)
                        .cornerRadius(50)
                        .shadow(color: Color.secondaryTitle.opacity(0.25), radius: 0, x:0, y:7)
                        .shadow(color: Color.secondaryTitle.opacity(0.08), radius: 10, x:0, y:-7)
                }.padding()
                
            }
           
            HStack {
                Button("Cancel") {
                    dismiss()
                }.buttonStyle(ReturnButtonStyle())
                Button("Add Challenge") {
                    modelContext.insert(Student(id: UUID(), name: controller.childName, classGroup: controller.childClass))
                }.buttonStyle(CreateButtonStyle())
            }
            Spacer()
        }.padding()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AddChallengeView(controller: ParentsCornerController())
}
