//
//  ProfileView.swift
//  HareQuest
//
//  Created by Luke Hilliard on 27/03/2026.
//

import SwiftUI

struct ProfileView: View {
	@StateObject private var controller = ProfileController()
	
    var body: some View {
        VStack()
        {
					Text(controller.sessionManager.getRole()?.capitalized ?? "No Role") // TODO fit actual role or name
                .font(.system(size: 78, weight: .heavy, design: .rounded))
                .foregroundColor(.black.opacity(0.85))
                .padding(.vertical)
            Text("We are still working on this screen, be on the lookout for updates!").multilineTextAlignment(.center)
                .font(.title).padding(.bottom)
            Button() {
                
                controller.logout()
            }label: {
                Text("Log out")
                Image(systemName: "rectangle.portrait.and.arrow.right")
            }
                .buttonStyle(SecondaryButtonStyle())
        }.padding()
    }
}

#Preview {
    ProfileView()
}
