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
        
      // Button("Hareobics with Harper"){}
         // .buttonStyle(GameButtonStyle(color: .secondaryButton, gameIcon: Image("HareobicsImage")))
        
       // Button("Jump"){}
         //.buttonStyle(ChallengeButton(coinsGain: 100))
        
        //ShopItem(   price: 40,
                  //  imageName: "LandingImage")
        
       // Button("Buy"){}
         //   .buttonStyle(BuyButton(coinsGain: 100))
        
       // Wallet(money: 200)
       // Pet()
         //   .frame(width: 500)
          //  .padding()
        
        KidCard(
            
            studentName: "Maya",
            studentLastName: "O'connor",
            year: "Year 1-2",
            gradedBy: "Victoria McNeil",
            grade: 9,
            comments: "Maya achieves average results and can produce solid work when focused, but their behaviour is ..."
        )
       
        
    }
}

#Preview {
    TestScreenView()
}
