//
//  Wallet.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 25/04/2026.
//

import SwiftUI
struct Wallet: View {
    var money: Int = 0
    var body: some View{
        HStack(spacing: 22) {
            Image("CoinImage")
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
            
            Text("\(money)")
                .font(.system(size: 78, weight: .medium, design: .rounded))
                .foregroundColor(.black.opacity(0.85))
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .background {
            Capsule()
                .fill(.white)
                .shadow(color: .black.opacity(0.25), radius: 14, x: 0, y: 10)
        }
    }}
