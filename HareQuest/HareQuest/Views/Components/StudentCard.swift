//
//  StudentCard.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 28/04/2026.
//


import SwiftUI

struct StudentCard: View {
    
    var studentName: String = "Maya"
    var studentLastName: String = "O'connor"
    var status: String = "N/A"
    var statusColor: Color = .gray
    
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                
                
                HStack {
                    Text(studentName)
                    Text(studentLastName)
                    
                } .font(.system(size: 24, weight: .heavy, design: .rounded))
                    .foregroundColor(.black.opacity(0.85))
                Spacer()
                
                Text(status)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(statusColor)
            }
            .padding(.vertical, 38)
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity)
            .background(statusColor.opacity(0.3))
            
            .buttonStyle(.plain)
            
        }
        
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.16), radius: 5, x: 0, y: 3)
        .padding(.vertical, 5)
        
    }
    
}

  
