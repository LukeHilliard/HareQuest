//
//  Pet.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 25/04/2026.
//

import SwiftUI
struct Pet: View {
    var userPet: Image = Image("PetImage")
    //TODO Make accesories work
    var body: some View {
      userPet
            .resizable()
            .scaledToFit()
       
        
    }}
