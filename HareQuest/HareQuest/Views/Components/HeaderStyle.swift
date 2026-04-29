//
//  Header.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 27/04/2026.
//

import SwiftUI

struct HeaderStyle: ButtonStyle {
    var color: Color = .blue
   

    func makeBody(configuration: Configuration) -> some View {
        HStack{
          
            configuration.label
                .font(.system(size: 36, weight: .heavy, design: .rounded))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.7)
                .padding(.top, 40)

        }
          
            .font(.system(.title3, design: .rounded, weight: .bold))
            .foregroundColor(.white)
            .padding(.horizontal, 40)
            .padding(.vertical, 40)
            .frame(maxWidth: .infinity)
            .background {
              Rectangle()

                    .foregroundColor(color)
                    
            }
            
    }
    

}
