//
//  ParentsCornerView.swift
//  HareQuest
//
//  Created by Luke Hilliard on 26/03/2026.
//

import SwiftUI


struct ParentsCornerView: View {
	@StateObject private var controller = ParentsCornerController()
    var body: some View {
			Header(title: "Parents Corner", backgroundColor: Color.blue)
			Text("My Kids")
				.font(.title)
			
			/// Horizontal line
			Capsule()
				.fill(Color.black)
				.frame(height: 2)
				.padding(.horizontal)
				
			
			
			Rectangle()
			.fill(Color.white)
			.frame(width: 300, height: 75)
			.overlay(
					RoundedRectangle(cornerRadius: 10)
							.stroke(Color.black, lineWidth: 2)
			)
			.cornerRadius(10)
		
			Spacer()
    }
}

#Preview {
    ParentsCornerView()
}
