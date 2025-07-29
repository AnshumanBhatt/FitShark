//
//  ProgessCircleView.swift
//  FitShark
//
//  Created by Anshuman Bhatt on 28/05/25.
//

import SwiftUI

struct ProgessCircleView: View {
    @Binding var progress: Int
    var color: Color
    var goal: Int
    private let width: CGFloat = 20
    var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(0.3), lineWidth: width)
            Circle()
                .trim(from: 0, to: CGFloat(progress) / CGFloat(goal))
                .stroke(color, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .shadow(radius: 5)
        }
    }
}

#Preview {
    ProgessCircleView(progress: .constant(100), color: .red, goal: 200)
}
