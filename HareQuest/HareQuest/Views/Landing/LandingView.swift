//
//  LandingView.swift
//  HareQuest
//
//  Created by Luke Hilliard on 23/03/2026.
//

import SwiftUI

struct LandingView: View {
    @StateObject private var controller = LandingController()
    
    var body: some View {
        NavigationStack { /// Parent navigation stack, this is passed to all child view (pretty much every view)
            VStack {
                
                Image("LandingImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .ignoresSafeArea(edges: .top)
                    .padding(0)
                    
              
                
                ZStack {
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 200)
                        .shadow(color: Color.black.opacity(0.3),
                                radius: 50, x:0, y:-100)
                        .padding(0)
                    VStack {
                        
                        Text("Welcome to Hare Quest")
                            .padding()
                            .font(.title)
                            .foregroundStyle(.accentTitle)
                            .fontWeight(.bold)
                        
                        
                        Button("Login") {
                            controller.openLoginView()
                        }
                        
                        .buttonStyle(DefaultButtonStyle())
                        
                        
                        
                        HStack {
                            Text("New to the burrow?")
                            Button("Register") {
                                controller.openRegisterView()
                            }
                            
                            .foregroundStyle(.accentTitle)
                        }
                        .padding()
                    }
                }
                
              
            }
                
                .navigationDestination(item: $controller.currentRoute) { route in
                    switch route {
                    case .login:
                        LoginView()
                    case .register:
                        RegisterView()
                    }
                }
            
        }
        .navigationBarBackButtonHidden(true)
    }}
    
#Preview {
    LandingView()
}
