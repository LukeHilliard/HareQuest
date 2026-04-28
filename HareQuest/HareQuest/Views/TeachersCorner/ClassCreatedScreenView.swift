//
//  ClassCreatedScreenView.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 28/04/2026.
//

import SwiftUI

struct ClassCreatedScreenView: View {
    var classCode = "No Code"
    var body: some View {
        Text("Class Group successfully created!")
            .multilineTextAlignment(.center)
            .font(.system(size: 16, weight: .regular, design: .rounded))
            .padding(.horizontal, 40)
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.mainButton.opacity(0.1))
                    .shadow(color: .mainButton.opacity(0.22), radius: 8, x: 4, y: 6)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.mainButton, lineWidth: 2)
                    }
                   
            }
            .padding()
  
             Text("Share the class code with your students:")
            .multilineTextAlignment(.center)
            .font(.system(size: 24, weight: .semibold, design: .rounded))
        Text(classCode)
            .font(.system(size: 36, weight: .heavy, design: .default)).padding(.top, 2)
        Button("Continue") {
            //dismiss()
        }.buttonStyle(DefaultButtonStyle())
    }
}

#Preview {
    ClassCreatedScreenView()
}
