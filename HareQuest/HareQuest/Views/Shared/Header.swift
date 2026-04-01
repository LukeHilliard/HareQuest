//
//  Header.swift
//  HareQuest
//
//  Created by Luke Hilliard on 01/04/2026.
//

import SwiftUI

/// A header component that is prestyled to wrap around the phones notch. 
struct Header: View {
	let title: String
	let backgroundColor: Color
	
	var body: some View {
		VStack(spacing: 0) {
			Text(title)
				.font(.title)
				.fontWeight(.bold)
				.foregroundColor(.white)
				.padding(.top, 60)
				.padding(.bottom, 20)
		}
		.frame(maxWidth: .infinity)
		.background(backgroundColor)
		.ignoresSafeArea(edges: .top)
	}
}

#Preview {
	Header(title: "Example Header", backgroundColor: Color.blue)
}
