//
//  StudentCard.swift
//  HareQuest
//
//  Created by Luke Hilliard on 01/05/2026.
//


import SwiftUI

struct ClassCard: View {
		
		var className: String
		var classLevel: String
	  var classCode: String
		var statusColor: Color
		
		
		var body: some View {
				VStack(spacing: 0) {
						HStack {
								HStack {
										Text("\(className)  \(classLevel)")
										Text("\(classCode)")
										
								} .font(.system(size: 24, weight: .heavy, design: .rounded))
										.foregroundColor(.black.opacity(0.85))
								Spacer()
								
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

	
