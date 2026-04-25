//
//  ShopItem.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 25/04/2026.
//

import SwiftUI
struct ShopItem: View {
    
        var price: Int = 40
        var imageName: String = "CoinImage"


        var body: some View {
            ZStack(alignment: .top) {
                cardBody

                priceBadge
                    .offset(y: -80)
                
                Button("Buy"){}
                    .buttonStyle(BuyButton(coinsGain: 100))
                    .offset(y: 340)
            }
            .padding(.top, 90)
        }

        private var priceBadge: some View {
            HStack(spacing: 22) {
                Image("CoinImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)

                Text("\(price)")
                    .font(.system(size: 78, weight: .medium, design: .rounded))
                    .foregroundColor(.black.opacity(0.85))
            }
            .padding(.horizontal, 54)
            .padding(.vertical, 20)
            .background {
                Capsule()
                    .fill(.white)
                    .shadow(color: .black.opacity(0.25), radius: 14, x: 0, y: 10)
            }
        }

        private var cardBody: some View {
            VStack(spacing: 0) {
                Spacer()

                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 330, height: 250)

                Spacer()

            }
            .frame(width: 360, height: 415)
            .background {
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color(red: 0.78, green: 0.66, blue: 0.43).opacity(0.45))
            }
            .clipShape(RoundedRectangle(cornerRadius: 24))
        }
    }



