//
//  TestScreenView.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 25/04/2026.
//

import SwiftUI

struct TestScreenView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        Button("Hareobics with Harper"){}
            .buttonStyle(GameButtonStyle(color: .secondaryButton, gameIcon: Image("HareobicsImage")))
    }
}

#Preview {
    TestScreenView()
}
