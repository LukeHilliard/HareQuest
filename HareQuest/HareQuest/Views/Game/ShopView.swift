//
//  ShopView.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 29/04/2026.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        ZStack{
            Color.shop
                .ignoresSafeArea(.all)
            VStack{
                VStack{
                    Text("SHOP")
                        .font(.system(size: 46, weight: .heavy, design: .rounded))
                        .foregroundStyle(.secondaryTitle)
                    Text("Accesories").font(.system(size: 36, weight: .heavy, design: .rounded))
                        .foregroundStyle(.secondaryTitle)
                
                }
                
                VStack{
                    HStack{
                        ShopItem(   price: 40,
                                    imageName: "Hat")
                        ShopItem(   price: 10,
                                    imageName: "Bracelet")
                        ShopItem(   price: 30,
                                    imageName: "Scarf")
                    }.frame(maxWidth: 500, maxHeight: 200)
                        .padding(.bottom)
                    
                    HStack{
                        ShopItem(   price: 25,
                                    imageName: "Tie")
                        ShopItem(   price: 50,
                                    imageName: "Necklace")
                        ShopItem(   price: 100,
                                    imageName: "Watch")
                    }.frame(maxWidth: 500, maxHeight: 200)
                        .padding(.top)
                }.padding(.horizontal)}
        }
    }
}

#Preview {
    ShopView()
}
