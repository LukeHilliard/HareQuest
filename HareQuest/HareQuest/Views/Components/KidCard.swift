//
//  KidCard.swift
//  HareQuest
//
//  Created by Mariela Machuca Palmeros on 26/04/2026.
//

import SwiftUI

struct KidCard: View {
    @State private var isExpanded = false
    var studentName: String = "Maya"
    var studentLastName: String = "O'connor"
    var year: String = "Year 1-2"
    var gradedBy: String = "Victoria McNeil"
    var date: Date = Date()
    var grade: Int = 8
    var comments: String = "Maya achieves average results and can produce solid work when focused, but their behaviour is ..."

    var body: some View {
        VStack(spacing: 0) {
            header

            if isExpanded {
                content
                    .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.16), radius: 5, x: 0, y: 3)
        .animation(.easeInOut(duration: 0.25), value: isExpanded)
    }

    private var header: some View {
       
            HStack {
               

                HStack {
                    Text(studentName)
                    Text(studentLastName)
                       
                } .font(.system(size: 24, weight: .semibold, design: .rounded))
                    .foregroundColor(.black.opacity(0.85))
                    Spacer()

                Button() {
                    isExpanded.toggle()
                }label: {
                    Image(systemName: isExpanded ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                }
                    .font(.system(size: 30))
                    .foregroundColor(.black)
            }
            .padding(.vertical, 38)
            .padding(.horizontal, 38)
            .frame(maxWidth: .infinity)
            .background(Color.challengeButton)
        
        .buttonStyle(.plain)
    }

    private var content: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text(year)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .frame(maxWidth: .infinity, alignment: .center)

            Divider()
                .background(.gray)

            HStack {
                Text("Graded by: \(gradedBy)")
                Spacer()
                Text(date.formatted(date: .numeric, time: .omitted))
               
            }
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(.gray)

            HStack {
                Text("Grade")
                    .font(.system(size: 18, weight: .bold))
                Spacer()
                Text("\(grade)/10")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.gray)
            }

            Text("Teacher’s Comments:")
                .font(.system(size: 18, weight: .bold))

            Text(comments)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.gray)
                .lineLimit(2)

            Button("Read More") {
                // read more action
            }
            .font(.system(size: 16, weight: .regular))
            .foregroundColor(.blue)
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 55)
        .padding(.vertical, 22)
    }
}
